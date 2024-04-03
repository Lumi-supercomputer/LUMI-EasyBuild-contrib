--[[

    file aocc module

    This module was produced with craypkg-gen 1.3.25

]]--


-- reasons to keep module from continuing --


family("compiler")
conflict("amd-mixed")


-- local vars: define & assign --


-- template variables ----------------------------------------------------------
local LMOD_DIR                = "amd"
local MOD_LEVEL               = "5.4.6"
local AMD_CURPATH             = "/appl/lumi/SW/LUMI-23.09/G/EB/rocm/5.4.6/"
local COMPAT_VERSION          = "4.0"
local MODULE_ROOT             = "/opt/cray/pe/lmod/modulefiles"
local INSTALL_ROOT            = "/opt/cray/pe/"
--------------------------------------------------------------------------------

local MODULEPATH              = os.getenv("MODULEPATH") or ""
local LMOD_TEST_PREFIX        = os.getenv("LMOD_TEST_PREFIX") or ""
local CRAY_COM_LOAD_VALUE     = LMOD_DIR .. "/" .. COMPAT_VERSION
local AMD_MOD_LIB_PATH       = LMOD_TEST_PREFIX .. MODULE_ROOT .. "/compiler/" .. CRAY_COM_LOAD_VALUE

local SCRIPT_NAME             = "lmodHierarchy.lua"
local SCRIPT_PATH             = LMOD_TEST_PREFIX .. INSTALL_ROOT .. "lmod_scripts/default/scripts/" .. SCRIPT_NAME


-- standard Lmod functions --


help ([[
]] .. MOD_LEVEL .. "\n" .. [[
]] .. AMD_CURPATH .. "\n" .. [[
This modulefile defines the system paths and environment
variables needed to use the AMD Optimizing C/C++ Compiler.

===================================================================
To see AMD/]] .. MOD_LEVEL .. [[ release information,
  visit https://rocmdocs.amd.com/en/latest
===================================================================

To make this the default version, execute:
  /opt/admin-pe/set_default_craypkg/set_default_amd_5.0.2


Certain components, files or programs contained within this package or product are Copyright 2021-2022 Hewlett Packard Enterprise Development LP.

]])

whatis("Defines the system paths and environment variables needed for the AMD LLVM Compiling Environment.")


-- local functions --


--[[

    get_lua_script
    Load a script to gain access to its content. If not able to load
    this function will prevent the module from loading via a LmodError

    param  mod
            name that the system path uses for the module. sometimes
            the name is the module's full name or a nickname.

    param  script_path
            path to the script file this function will load

    return lua code chunk: the chunk may be either a function or
            table of functions.

]]--
function get_lua_script(mod, script_path)
    local chunk, err_msg = loadfile (script_path)
    -- chunk is nil and err exists if file did not load
    if not chunk and mode() == "load" then
        LmodError("\n\nUnable to load " .. tostring(mod) ..
                  " module. Please contact your system administrator.\n" ..
                  "\n\nError Message: " .. tostring(err_msg) .. "\n")
    end
    return chunk()
end


-- environment modifications --
prepend_path ( "MODULEPATH", "/opt/cray/pe/lmod/modulefiles/mix_compilers")
prepend_path ( "MODULEPATH",        AMD_MOD_LIB_PATH )

prepend_path ( "PATH",              AMD_CURPATH .. "/bin" )

prepend_path ( "LIBRARY_PATH",      AMD_CURPATH .. "/llvm/lib" )
prepend_path ( "LD_LIBRARY_PATH",   AMD_CURPATH .. "/llvm/lib" )

prepend_path ("C_INCLUDE_PATH",     AMD_CURPATH .. "/llvm/include")
prepend_path ("CPLUS_INCLUDE_PATH", AMD_CURPATH .. "/llvm/include")

prepend_path ("CMAKE_PREFIX_PATH",  AMD_CURPATH)
prepend_path ("CMAKE_PREFIX_PATH",  AMD_CURPATH .. "/hip")

setenv ("ROCM_COMPILER_PATH",       AMD_CURPATH .. "/llvm")
setenv ("ROCM_COMPILER_VERSION",    MOD_LEVEL)
setenv ("CRAY_AMD_COMPILER_PREFIX", AMD_CURPATH)
setenv ("CRAY_AMD_COMPILER_VERSION",MOD_LEVEL)

setenv ("ROCM_PATH",                AMD_CURPATH)
setenv ("HIP_PATH",                 AMD_CURPATH .. "/hip")
setenv ("HIP_LIB_PATH",             AMD_CURPATH .. "/lib")
setenv ("HSA_PATH",                 AMD_CURPATH .. "/hsa")
prepend_path ("CMAKE_PREFIX_PATH",  AMD_CURPATH)
prepend_path ("CMAKE_PREFIX_PATH",  AMD_CURPATH .. "/hip")
prepend_path ("LD_LIBRARY_PATH",    AMD_CURPATH .. "/lib")
prepend_path ("LD_LIBRARY_PATH",    AMD_CURPATH .. "/lib64")
prepend_path ("LD_LIBRARY_PATH",    AMD_CURPATH .. "/hsa/lib")

setenv ("CRAY_LMOD_COMPILER", CRAY_COM_LOAD_VALUE)


-- add paths to Lmod hierarchy --


local lmodHierarchy = get_lua_script(myModuleName(), SCRIPT_PATH)
-- add comnet path if network module loaded.
-- note: only call handshake functions after CRAY_LMOD_COMPILER has been set
lmodHierarchy.handshake_comnet(LMOD_TEST_PREFIX .. INSTALL_ROOT)
lmodHierarchy.handshake_comcpu(LMOD_TEST_PREFIX .. INSTALL_ROOT)
lmodHierarchy.handshake_cncm(LMOD_TEST_PREFIX .. INSTALL_ROOT)
-- add user defined path if it exists
lmodHierarchy.get_user_custom_path("COMPILER", CRAY_COM_LOAD_VALUE)

-- ----------------------------------------------------------------------------
-- !! keep last !!
-- this code must be placed after any path changes
-- ----------------------------------------------------------------------------

-- Conflict with PrgEnv-* modules that do not support this compiler
-- If block logic doesn't require updating for any new PRGENV-* modules added in future
if os.getenv("LMOD_FAMILY_PRGENV") ~= nil then
    if (not isloaded("PrgEnv-amd")) then
        load("PrgEnv-amd")
    end
end
