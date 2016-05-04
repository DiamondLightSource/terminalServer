from iocbuilder import AutoSubstitution
from iocbuilder import Device
from iocbuilder.arginfo import *
from iocbuilder.modules.snmp import Snmp

class _moxa(AutoSubstitution):
    TemplateFile = 'Moxa.template'

class _moxaChannel(AutoSubstitution):
    TemplateFile = 'MoxaChannel.template'

class _acs(AutoSubstitution):
    TemplateFile = 'Acs.template'

class _acsChannel(AutoSubstitution):
    TemplateFile = 'AcsChannel.template'

class moxa(Device):
    Dependencies = (Snmp, )

    def __init__(self, P, R, HOST, NCHANS, **args):
        Device.__init__(self)
        _moxa(P=P, R=R, HOST=HOST, NCHANS=NCHANS)
        for i in range(NCHANS):
            _moxaChannel(P=P, R=R, CHAN=i+1, HOST=HOST)

    ArgInfo = makeArgInfo(__init__,
        P = Simple("PV prefix", str),
        R = Simple("PV suffix", str),
        HOST = Simple("Host IP address", str),
        NCHANS = Simple("Number of channels", int))

class acs(Device):
    Dependencies = (Snmp, )

    def __init__(self, P, R, HOST, NCHANS, **args):
        Device.__init__(self)
        _acs(P=P, R=R, HOST=HOST, NCHANS=NCHANS)
        for i in range(NCHANS):
            _acsChannel(P=P, R=R, CHAN=i+1, HOST=HOST)

    ArgInfo = makeArgInfo(__init__,
        P = Simple("PV prefix", str),
        R = Simple("PV suffix", str),
        HOST = Simple("Host IP address", str),
        NCHANS = Simple("Number of channels", int))
