from iocbuilder import AutoSubstitution

from iocbuilder.modules.snmp import Snmp

class moxa(AutoSubstitution):
    Dependencies = (Snmp,)
    TemplateFile = 'Moxa.template'

class moxaChannel(AutoSubstitution):
    Dependencies = (Snmp,)
    TemplateFile = 'MoxaChannel.template'

class acs(AutoSubstitution):
    Dependencies = (Snmp,)
    TemplateFile = 'Acs.template'

class acsChannel(AutoSubstitution):
    Dependencies = (Snmp,)
    TemplateFile = 'AcsChannel.template'
