##
# Copyright 2015-2020 Ghent University
#
# This file is part of EasyBuild,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://www.vscentrum.be),
# Flemish Research Foundation (FWO) (http://www.fwo.be/en)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# https://github.com/easybuilders/easybuild
#
# EasyBuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# EasyBuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EasyBuild.  If not, see <http://www.gnu.org/licenses/>.
##
"""
EasyBuild support for installing Cray cpe toolchains, implemented as an easyblock

@author: Kenneth Hoste (Ghent University)
@author: Guilherme Peretti Pezzi (CSCS)
@author: Petar Forai (IMP/IMBA)
#author: Kurt Lust (University of Antwerp and LUMI)
"""

from easybuild.easyblocks.generic.bundle import Bundle
from easybuild.tools.build_log import EasyBuildError
from easybuild.framework.easyconfig import CUSTOM, MANDATORY
from easybuild.tools.build_log import print_error, print_msg, print_warning
import re

# Supported programming environments
KNOWN_PRGENVS = ['PrgEnv-cray', 'PrgEnv-gnu', 'PrgEnv-aocc', 'PrgEnv-amd', 'PrgEnv-intel', 'PrgEnv-nvidia']
KNOWN_CPEMODS = ['cpeCray', 'cpeGNU', 'cpeAOCC', 'cpeAMD', 'cpeIntel', 'cpeNVIDIA']
# Mapping from supported toolchain modules to PrgEnv-* modules
MAP_TOOLCHAIN_PRGENV = {
    'cpeCray':   'cray',
    'cpeGNU':    'gnu',
    'cpeAOCC':   'aocc',
    'cpeAMD':    'amd',
    'cpeIntel':  'intel',
    'cpeNVIDIA': 'nvidia',
}
# Mapping from supported toolchain modules to compiler modules.
MAP_TOOLCHAIN_COMPILER = {
    'cpeCray':   'cce',
    'cpeGNU':    'gcc',
    'cpeAOCC':   'aocc',
    'cpeAMD':    'amd',
    'cpeIntel':  'intel',
    'cpeNVIDIA': 'NVIDIA',
}


class CrayPEToolchain(Bundle):
    """
    Compiler toolchain: generate module file only, nothing to build/install
    """
    @staticmethod
    def extra_options():
        """Custom easyconfig parameters for CrayPEToolchain"""
        extra_vars = {
            'PrgEnv': [None, 'PrgEnv module to load, e.g., cray to load PrgEnv-cray, or None for automatic determination', CUSTOM],
            'PrgEnv_load': [True, 'Load the PrgEnv module (if True) or just set the corresponding environment variable (if False)', CUSTOM],
            'PrgEnv_family': [None, 'Declare to be a member of the PrgEnv family (if \'PrgEnv\), of the cpeToolchain family (if \'cpeToolchain\') or manually unload all known PrgEnv and cpe* modules (if None, needed when LMOD is not used)', CUSTOM],
            'CPE_compiler': [None, 'Versionless compiler module to load, or None for automatic determination', CUSTOM],
            'CPE_version': [None, 'Version of the CPE, if different from the version of the module', CUSTOM],
            'CPE_load': [ 'first', 'First load the cpe module (if \'first\'), after the PrgEnv module (if \'after\'), load it at the end (if \'last\'), or do not load the cpe module (if None)', CUSTOM],
            'cray_targets': [[], 'Targetting modules to load', CUSTOM],
            #'optional_example_param': [None, "Example optional custom parameter", CUSTOM],
        }
        return Bundle.extra_options(extra_vars)

    def prepare_step(self, *args, **kwargs):
        """Prepare build environment (skip loaded of dependencies)."""

        kwargs['load_tc_deps_modules'] = False

        super(CrayPEToolchain, self).prepare_step(*args, **kwargs)

    def make_module_dep(self):
        """
        Generate load/swap statements for the module file
        """

        #
        # First do some processing of and checks on the parameters
        #

        # One value that we will need a lot
        if self.cfg['PrgEnv_family'] == None:
            PrgEnv_family = None
        else:
            PrgEnv_family = self.cfg['PrgEnv_family'].lower()

        # Illegal parameter combination: PrgEnv_family True and PrgEnv_load True.
        if PrgEnv_family == 'prgenv' and self.cfg['PrgEnv_load']:
            raise EasyBuildError('Setting PrgEnv_family to \'PrgEnv\' and PrgEnv_load to True is not a valid combination.')

        # Illegal parameter combination: PrgEnv_load False and CPE_load == 'after'
        if self.cfg['CPE_load'] == 'after' and not self.cfg['PrgEnv_load']:
            raise EasyBuildError('Setting CPE_load to \'after\' and PrgEnv_load to False is not a valid combination.')

        # Determine the PrgEnv module
        if self.cfg['PrgEnv'] is None:
            try:
                prgenv_name = MAP_TOOLCHAIN_PRGENV[self.cfg['name']]
            except:
                raise EasyBuildError('%s is not a supported toolchain, you\'ll need to specify both PrgEnv and CPE_compiler.',
                                     self.cfg['name'])
        else:
            prgenv_name = self.cfg['PrgEnv']
            if not 'PrgEnv-' + prgenv_name in KNOWN_PRGENVS:
                print_warning('PrgEnv-%s is not a supported PrgEnv module. Are you sure it is not a typo?', prgenv_mod)

        prgenv_mod = 'PrgEnv-' + prgenv_name

        self.log.debug("Detected PrgEnv-module: %s (version may be added through dependencies)", prgenv_mod)

        # Determine the compiler module
        if self.cfg['CPE_compiler'] in [ None, 'auto']:
            try:
                compiler_mod = MAP_TOOLCHAIN_COMPILER[self.cfg['name']]
            except:
                raise EasyBuildError('%s is not a supported toolchain, you\'ll need to specify both PrgEnv and CPE_compiler.',
                                     self.cfg['name'])
        else:
            compiler_mod = self.cfg['CPE_compiler']

        self.log.debug("Detected compiler module: %s (version may be added through dependencies", compiler_mod)

        # Cray wrappers module
        craype_mod = 'craype'

        # Determine the cpe module (if needed)
        if self.cfg['CPE_load'] != None:
            if self.cfg['CPE_version'] is None:
                cpe_load_version = self.cfg['version']
            else:
                cpe_load_version = self.cfg['CPE_version']

            self.log.debug("Loading CPE version: %s (may be overwritten by dependencies)", cpe_load_version)

            cpe_mod = 'cpe/' + cpe_load_version

        # Build a list of dependencies without version
        collect_deps = []
        force_compiler = False
        force_craype = False
        for dep in self.toolchain.dependencies:
            mod_name = dep['full_mod_name']
            if mod_name.startswith(prgenv_mod):
                prgenv_mod = mod_name
            elif mod_name.startswith(compiler_mod):
                compiler_mod = mod_name
                force_compiler = True
            elif mod_name.startswith(craype_mod):
                craype_mod = mod_name
                force_craype = True
            elif not (mod_name == 'cpe' or mod_name.startswith('cpe/')):
                collect_deps.append(mod_name)

        #
        # Now start generating the load commands and other stuff.
        #

        collect_statements = [''] # Will start with an empty line.

        # Do we need a family directive?
        if PrgEnv_family == 'prgenv':
            collect_statements = collect_statements + [ 'family(\'PrgEnv\')', '' ]
        elif PrgEnv_family == 'cpetoolchain':
            collect_statements = collect_statements + [ 'family(\'cpeToolchain\')', '' ]

        # Do we need to unload the PrgEnv modules?
        if PrgEnv_family == None and self.cfg['PrgEnv_load']:
            # Need to unload all PrgEnv-* modules except the one used by the module
            for prgenv in [prgenv for prgenv in KNOWN_PRGENVS if not prgenv_mod.startswith(prgenv)]:
                collect_statements.append(self.module_generator.unload_module(prgenv).strip())
            collect_statements.append('')
        elif (PrgEnv_family == 'cpetoolchain' or PrgEnv_family == None) and not self.cfg['PrgEnv_load'] :
            # Need to unload all PrgEnv-* modules.
            for prgenv in KNOWN_PRGENVS:
                collect_statements.append(self.module_generator.unload_module(prgenv).strip())
            collect_statements.append('')

        # Do we need to unload the cpe* modules?
        if PrgEnv_family == None:
            for cpe in [cpe for cpe in KNOWN_CPEMODS if not self.name.startswith(cpe)]:
                collect_statements.append(self.module_generator.unload_module(cpe).strip())
            collect_statements.append('')


        # Set PE_ENV if no PrgEnv-* module is loaded.
        if not self.cfg['PrgEnv_load']:
            collect_statements.append(self.module_generator.set_environment('PE_ENV', prgenv_name.upper(), False).lstrip())

        # Load the cpe module (if CPE_load is first)
        if self.cfg['CPE_load'] != None and self.cfg['CPE_load'].lower() == 'first':
            collect_statements.append(self.module_generator.load_module(cpe_mod, recursive_unload=False).lstrip())

        # load statement for selected PrgEnv module (only when not loaded yet)
        if self.cfg['PrgEnv_load']:
            collect_statements.append(self.module_generator.load_module(prgenv_mod, recursive_unload=False).lstrip())

        # Load the cpe module (if CPE_load is after)
        if self.cfg['CPE_load'] != None and self.cfg['CPE_load'].lower() == 'after':
            collect_statements.append(self.module_generator.load_module(cpe_mod, recursive_unload=False).lstrip())

        # Prepare the load statements for the targeting modules
        for dep in self.cfg['cray_targets']:
            collect_statements.append(self.module_generator.load_module(dep, recursive_unload=False).lstrip())

        # Load the selected compiler module, if not done through the dependencies or PrgEnv
        if (not self.cfg['PrgEnv_load']) or force_compiler:
            collect_statements.append(self.module_generator.load_module(compiler_mod, recursive_unload=False).lstrip())

        # Load the Cray compiler wrapper module, if not done through the dependencies
        if (not self.cfg['PrgEnv_load']) or force_craype:
            collect_statements.append(self.module_generator.load_module(craype_mod, recursive_unload=False).lstrip())

        # Now load the dependencies, using the full name and version if they are specified that way.
        for dep in collect_deps:
            collect_statements.append(self.module_generator.load_module(dep).lstrip())

        # Load the cpe module (if CPE_load is last)
        if self.cfg['CPE_load'] != None and self.cfg['CPE_load'].lower() == 'last':
            collect_statements.append(self.module_generator.load_module(cpe_mod, recursive_unload=False).lstrip())

        # Assemble all module unload/load statements.
        txt = '\n'.join(collect_statements)
        return txt
