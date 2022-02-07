terminalServer
==============

An EPICS support module which can configure and read configuration of Moxa and ACS terminal server ports using SNMP.

Setup
------------

Dependencies (set paths in RELEASE.local):

* snmp: https://groups.nscl.msu.edu/controls/
* calc

On Moxa terminal servers, check SNMP communucation is enabled under SNMP agent settings and set read and write community strings to the following:

* read: public
* write: private

Limitations
-----------

The readbacks are manually copied into demands by processing the following record in TerminalServer{16/32}.temaplte: record(seq, "$(P)$(R):DOREAD"). It takes a significant amount of time to poll all of the initial parameters, and then this record should be processed to cause the autosave file to update. This can also mean the current autosave file demands to be emptied at IOC boot, but the backup file should have the correct values.
