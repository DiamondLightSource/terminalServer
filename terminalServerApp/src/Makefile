TOP=../..

include $(TOP)/configure/CONFIG

# -------------------------------
# Build a Diamond Support Module
# -------------------------------

LIBRARY_IOC += terminalServer

DBD += terminalServer.dbd
terminalServer_DBD += base.dbd
terminalServer_DBD += devSnmp.dbd

include $(TOP)/configure/RULES
