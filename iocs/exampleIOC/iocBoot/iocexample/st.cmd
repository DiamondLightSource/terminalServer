#!../../bin/linux-x86_64/example

< envPaths

epicsEnvSet "EPICS_TS_MIN_WEST", '0'


# Loading libraries
# -----------------

# Device initialisation
# ---------------------

cd "${TOP}"

dbLoadDatabase "dbd/example.dbd"
example_registerRecordDeviceDriver(pdbbase)

# Autosave and restore initialisation
set_requestfile_path "$(TERMINALSERVER)/terminalServerApp/Db"
set_requestfile_path "$(TOP)/autosave"
set_savefile_path "$(TOP)/autosave"

save_restoreSet_status_prefix "example"
save_restoreSet_Debug 0
save_restoreSet_NumSeqFiles 3
save_restoreSet_SeqPeriodInSeconds 600
save_restoreSet_DatedBackupFiles 1
save_restoreSet_IncompleteSetsOk 1
set_pass0_restoreFile "autosave.sav"
set_pass1_restoreFile "autosave.sav"

# Records for a 16 port Moxa terminal server
# ------------------------------------------

# Core templates
dbLoadRecords("$(TERMINALSERVER)/db/TerminalServer16.template", "P=BL99P-NT-TSERV-01, R=, name=Moxa1")
dbLoadRecords("$(TERMINALSERVER)/db/Moxa.template", "P=BL99P-NT-TSERV-01, R=, HOST=bl99p-nt-tserv-01, name=Moxa1_top")

# Channel templates
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=1, HOST=bl99p-nt-tserv-01, name=Moxa1_1")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=2, HOST=bl99p-nt-tserv-01, name=Moxa1_2")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=3, HOST=bl99p-nt-tserv-01, name=Moxa1_3")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=4, HOST=bl99p-nt-tserv-01, name=Moxa1_4")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=5, HOST=bl99p-nt-tserv-01, name=Moxa1_5")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=6, HOST=bl99p-nt-tserv-01, name=Moxa1_6")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=7, HOST=bl99p-nt-tserv-01, name=Moxa1_7")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=8, HOST=bl99p-nt-tserv-01, name=Moxa1_8")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=9, HOST=bl99p-nt-tserv-01, name=Moxa1_9")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=10, HOST=bl99p-nt-tserv-01, name=Moxa1_10")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=11, HOST=bl99p-nt-tserv-01, name=Moxa1_11")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=12, HOST=bl99p-nt-tserv-01, name=Moxa1_12")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=13, HOST=bl99p-nt-tserv-01, name=Moxa1_13")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=14, HOST=bl99p-nt-tserv-01, name=Moxa1_14")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=15, HOST=bl99p-nt-tserv-01, name=Moxa1_15")
dbLoadRecords("$(TERMINALSERVER)/db/MoxaChannel.template", "P=BL99P-NT-TSERV-01, R=, CHAN=16, HOST=bl99p-nt-tserv-01, name=Moxa1_16")

# Final ioc initialisation
# ------------------------
iocInit

# Autosave monitoring
create_monitor_set("autosave.req", 30, "P=BL99P-NT-TSERV-01,R=")
