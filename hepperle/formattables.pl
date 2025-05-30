#!/usr/bin/perl
#
#
# Program:	formattables.pl
# Creator:	Eric Hepperle
# Date:	12/14/01
#
# Purpose:	Simple example of how to use the format command to define fixed character widths in columnar tables for printing.
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";

print "This program is called formattables.pl\n";
print "\n";


@listfiles = `/usr/bin/ls -lat *.pl`;

print @listfiles;

print "Filename:\t\t\tMonth:\tOwner:\n";

print "=========================================\n\n";


foreach $line (@listfiles) {

   @spline = split(/\s+/, $line);

   $owner = @spline[2];

   $month = @spline[5];

   $file = @spline[8];

   write STDOUT_TOP;
   write STDOUT;

   format STDOUT_TOP =
                               Passwd File
       Name                Login    Office   Uid   Gid Home
       ------------------------------------------------------------------
       .
   format STDOUT =
       @<<<<<<<<<<<<<<<<<< @||||||| @<<<<<<@>>>> @>>>> @<<<<<<<<<<<<<<<<<
       $file,              $month,  $owner,
.

}


#--------------------------------------

DOESN'T WORK AT ALL !!!!!!!!!!
