# Dummy EasyBlock to ensure that the parameter used to point to the EasyBlock repository
# does not produce an error message in eb --show-config.

from easybuild.framework.easyblock import EasyBlock
from easybuild.tools.run import run_cmd


class EB_DummyExample(EasyBlock):
    """Custom easyblock for Example"""
