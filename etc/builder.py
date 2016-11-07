from iocbuilder import AutoSubstitution
from iocbuilder import Device
from iocbuilder.arginfo import *
from iocbuilder.modules.snmp import Snmp
from iocbuilder.modules.calc import Calc

class _terminalServer32(AutoSubstitution):
    TemplateFile = 'TerminalServer32.template'

class _terminalServer16(AutoSubstitution):
    TemplateFile = 'TerminalServer16.template'

class _moxa(AutoSubstitution):
    TemplateFile = 'Moxa.template'

class _moxaChannel(AutoSubstitution):
    TemplateFile = 'MoxaChannel.template'

class _acs(AutoSubstitution):
    TemplateFile = 'Acs.template'

class _acsChannel(AutoSubstitution):
    TemplateFile = 'AcsChannel.template'

class Moxa(Device):
    Dependencies = (Snmp, Calc)

    def __init__(self, name, P, R, HOST, NCHANS, **args):
        Device.__init__(self)
        if NCHANS > 16:
            _terminalServer32(name=name, P=P, R=R)
        else:
            _terminalServer16(name=name, P=P, R=R)
        _moxa(name=name+"_top", P=P, R=R, HOST=HOST)
        for i in range(NCHANS):
            _moxaChannel(name=name+"_"+str(i+1), P=P, R=R, CHAN=i+1, HOST=HOST)

    ArgInfo = makeArgInfo(__init__,
                          name = Simple("Object name", str),
                          P = Simple("PV prefix", str),
                          R = Simple("PV suffix", str),
                          HOST = Simple("Host IP address", str),
                          NCHANS = Simple("Number of channels", int))

class Acs(Device):
    Dependencies = (Snmp, Calc)

    def __init__(self, name, P, R, HOST, NCHANS, **args):
        Device.__init__(self)
        if NCHANS > 16:
            _terminalServer32(name=name, P=P, R=R)
        else:
            _terminalServer16(name=name, P=P, R=R)
        _acs(name=name+"_top", P=P, R=R, HOST=HOST)
        for i in range(NCHANS):
            _acsChannel(name=name+"_"+str(i+1), P=P, R=R, CHAN=i+1, HOST=HOST)

    ArgInfo = makeArgInfo(__init__,
                          name = Simple("Object name", str),
                          P = Simple("PV prefix", str),
                          R = Simple("PV suffix", str),
                          HOST = Simple("Host IP address", str),
                          NCHANS = Simple("Number of channels", int))
