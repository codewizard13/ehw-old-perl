#!/usr/bin/perl
#
#
# Program:	formattables_ex3.pl
# Creator:	Eric Hepperle
# Date:		12/14/01
#
# Purpose:	Simple example of how to use the format command to define fixed character widths in columnar tables for printing. The first one didn't work. Second attempt.
#
###################################################
#
# Revisions:
#
#	12/14/01 - Original.
#
#	12/14/01 - (Version 3) Works great.
#


#------------------------------------------------------|
### BEGIN NEW ###

#$| = 1;

$~ = STDOUT_TOP;
write;

@passwdfile = `cat /etc/passwd`;

foreach $line (@passwdfile) {

   @spasswd = split (/:/, $line);

   # NOTE:	Use $variable[x] instead of array
   #		@array[x].
   #

   $afsid = $spasswd[0];

   $namenser = $spasswd[4];

   @nmserary = split(/,/, $namenser);

   $fullname = $nmserary[0];

   $serial = $nmserary[1];

   $~ = REPORT;

   write;

}

# Set Header format:
   format STDOUT_TOP =
                             Passwd File

   AFS ID:       Employee Name:      Serial #:
   ------------------------------------------------------------------
.     


# Set Data format:
   format REPORT =
    @<<<<<<<<    @<<<<<<<<<<<<<<<<   @<<<<<<<<   IBM, Rochester
    $afsid,       $fullname,          $serial
.




# NOTE:	It is crucial to have the period all the
#	way on the left.  If there is any whitespace
#	preceding the period, the script will fail.


__END__

# NOTE: The "__END__" string is an operator which
#	tells the program to not process anything
#	this line.

# NOTE: Output sample:
#
#                             Passwd File
#
#   AFS ID:       Employee Name:      Serial #:
#   ------------------------------------------------------------------
#    root         System Root         289085-     IBM, Rochester
#    004742       S Francis           004742      IBM, Rochester
#    007829       Lucky Brunet        007829      IBM, Rochester
#    009320       T Barker            009320      IBM, Rochester
#    012421       Rafael Castellano   012421      IBM, Rochester
#    012479       Mark_M Williams     012479      IBM, Rochester
