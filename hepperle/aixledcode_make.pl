#!/usr/bin/perl
#
# Program:	aixledcode_make.pl
# Creator:	Eric Hepperle
# Date:		06/07/01
#
# Purpose:	This program lets a user enter in an AIX LED error code and it will output the meaning of that code per "Service Request Number Cross-Reference Version 4.1"
#
################################################

#----------
# Create hash:
#

print "Enter the code you want to retrieve\n";
$key = <STDIN>;
chomp $key;


# if key is blank or invalid tell user.
if ($key ne "") {


%CODES;

$CODES{100} = "BIST completed successfully; control was passed to IPL ROS.";
$CODES{101} = "BIST started following Reset.";
$CODES{102} = "BIST started following Power-on Reset.";
$CODES{103} = "BIST could not determine the system model number.";
$CODES{104} = "Equipment conflict; BIST could not find the CBA.";
$CODES{105} = "BIST could not read from the OCS EPROM.";
$CODES{106} = "BIST detected a module error.";
$CODES{111} = "OCS stopped; BIST detected a module error.";
$CODES{112} = "A checkstop occurred during BIST; checkstop results could not be logged out.";
$CODES{113} = "BIST checkstop count is greater than 1.";
$CODES{120} = "BIST starting a CRC check on the 8752.";
$CODES{99} = "TEST";
$CODES{"099"} = "099TEST";
$CODES{"088"} = "088TEST";
$CODES{88} = "TEST2";
$CODES{121} = "BIST detected a bad CRC in the first 32K of the OCS EPROM.";
$CODES{122} = "BIST started a CRC check in the first 32K of the OCS EPROM.";
$CODES{123} = "BIST detected a bad CRC in the OCS area of NVRAM.";
$CODES{124} = "BIST started a CRC check on the OCS area of NVRAM.";
$CODES{125} = "BIST detected a bad CRC on the time-of-day area of NVRAM.";
$CODES{126} = "BIST started a CRC check on the time-of-day area of NVRAM.";
$CODES{127} = "BIST detected a bad CRC on the 8752 EPROM.";
$CODES{128} = "EPOW not connected.";
$CODES{130} = "BIST presence test started.";
$CODES{140} = "Running BIST. (Box Manufacturing Mode Only).";
$CODES{142} = "Box manufacturing mode operation.";
$CODES{143} = "Invalid memory configuraton.";
$CODES{144} = "Manufacturing test failure.";
$CODES{"2000"} = "TEST2000";
$CODES{151} = "BIST started AIPGM test code.";
$CODES{152} = "BIST started DCLST test code.";
$CODES{153} = "BIST started ACLST test code.";
$CODES{154} = "BIST started AST test code.";
$CODES{160} = "Bad EPOW Signal/Power status signal.";
$CODES{161} = "BIST being conducted on BUMP I/O.";
$CODES{162} = "BIST being conducted on JTAG.";
$CODES{163} = "BIST being conducted on Direct I/O.";
$CODES{164} = "BIST being conducted on CPU.";
$CODES{165} = "BIST being conducted on DCB.";
$CODES{166} = "BIST being conducted on Interrupts.";
$CODES{170} = "BIST being conducted on Multi-Processors.";
$CODES{180} = "Logout in progress.";
$CODES{185} = "A checkstop condition occurred during the BIST.";
$CODES{186} = "System logic-generated checkstop (Model 250).";
$CODES{187} = "Graphics-generated checkstop (Model 250).";
$CODES{195} = "BIST logout completed.";
$CODES{888} = "BIST did not start.";
$CODES{"flashing 888"} = "Press reset 3 times.  Each time, watch for a new code it will give you.  These codes indicate the actual problem.";
$CODES{"20c"} = "L2 cache POST error. (The display shows a solid 20c for 5 seconds).";
$CODES{"21c"} = "L2 cache is not detected. (The display shows a solid 21c for 2 seconds.)";
$CODES{"22c"} = "Attempting a normal mode IPL from FDDI specified in NVRAM IPL device list.";
$CODES{"23c"} = "Attempting a normal mode IPL from FDDI specified in IPL ROM device list.";
$CODES{"24c"} = "Attempting a service mode IPL from FDDI specified in NVRAM IPL device list.";
$CODES{200} = "IPL attempted with keylock in the Secure position.";
$CODES{201} = "IPL ROM test failed or checkstop occurred (irrecoverable).";
$CODES{202} = "Unexpected machine check interrupt.";
$CODES{203} = "Unexpected data storage interrupt.";
$CODES{204} = "Unexpected instuction storage interrupt.";
$CODES{205} = "Unexpected external interrupt.";
$CODES{206} = "Unexpected alignment interrupt.";
$CODES{207} = "Unexpected program interrupt.";
$CODES{208} = "Unexpected floating point unavailable interrupt.";
$CODES{209} = "Unexpected SVC interrupt.";
$CODES{210} = "Unexpected SVC interrupt.";
$CODES{211} = "IPL ROM CRC comparison error (irrecoverable).";
$CODES{212} = "RAM POST memory configuration error or no memory found (irrecoverable).";
$CODES{213} = "RAM POST failure (irrecoverable).";
$CODES{214} = "Power status register failed (irrecoverable).";
$CODES{215} = "A low voltage condition is present (irrecoverable)";
$CODES{216} = "IPL ROM code being uncompressed into memory.";
$CODES{217} = "End of boot list encountered.";
$CODES{218} = "RAM POST is looking for good memory.";
$CODES{219} = "RAM POST bit map is being generated.";
$CODES{220} = "IPL control block is being initialized.";
$CODES{221} = "NVRAM CRC comparison error during AIX IPL (key mode switch in Normal mode).  Reset NVRAM by reaccomplishing IPL in Service mode.  For systems with an internal, direct-bus-attached (DBA) disk, IPL ROM attempted to perform an IPL from that disk before halting with this operator panel display value.";
$CODES{222} = "Attempting a Normal mode IPL from Standard I/O planar-attached devices specified in NVRAM IPL Devices List.";
$CODES{223} = "Attempting a Normal mode IPL from SCSI-attached devices specified in NVRAM IPL Devices list.";
$CODES{224} = "Attempting a Normal mode IPL from 9333 subsystem device specified in NVRAM IPL Devices list.";
$CODES{"status"} = "--- UNFINISHED 06/08/01 ---";




} else {

    print "The key $key is invalid!\n";
    print "\n";

}

print "\n";

# Read codes one-at-a-time.
if ($CODES{$key})
{

    print "$key = $CODES{$key}\n";
    print "\n";

}


print "\n";

print "<Press ENTER to continue>\n";
$hold = <STDIN>;

#----------
# Retrieve values from hash:
#

#$count = 1;

foreach $key (sort keys %CODES) {

   $msg = $CODES{$key};
   # do something with $key and $value  

   print "$key = $msg\n";

#   $count++;

}
