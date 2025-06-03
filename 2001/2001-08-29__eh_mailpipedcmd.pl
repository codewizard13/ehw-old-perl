#!/usr/bin/perl
# File eh_mailpipedcmd.pl created by Eric Hepperle at 15:00:42 on Wed Aug 29 2001. 
#
# Program:	eh_mailpipedcmd.pl
# Creator:	Eric Hepperle
# Date:		08/29/01
#
# Purpose:	Searches for id's owned by a user
#		based on an employee serial
#		entered	by the user.
#
#		Additionally, it converts the
#		serial to uppercase, then lower
#		case and does a modified search
#		as well.
#
#		Finally, it will mail someone the
#		results.
#
##################################################
#


$tmpidfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/tempidfile.ez";

# clear the tmpidfile if it exists.
if (-e $tmpidfile) {

   open (MAILFL, ">$tmpidfile");

      print MAILFL "\n";

   close (MAILFL);

}


print "\n\n";
print "#########################################\n";
print "\n";
print "This script lets you run a command and then mail\n";
print "the result to an email address.\n";
print "\n";

print "Enter an employee serial number: ";
$serial = <STDIN>;
chomp $serial;
print "\n";

# Tracing:

&uc2lc_serialconv;

&lc2uc_serialconv;


print "Serial in Upper-Case = $serial_uc\n\n";
print "Serial in Lower-Case = $serial_lc\n\n";

print "The serial you entered was:  $serial\n\n";
print "(Press Any Key to Continue)\n";
print "\n";
$hold = <STDIN>;

@yourids = `grep $serial /etc/passwd`;
@yourids_uc = `grep $serial_uc /etc/passwd`;
@yourids_lc = `grep $serial_lc /etc/passwd`;
print "\n";


print "The id's you own are:\n";
print "-----------------------------------------\n\n";

   if (@yourids ne "") {

      print "$serial.'s id's:\n\n";
      print "@yourids\n\n";

   }

   if (@yourids_uc ne "") {

      print "upper case $serial.'s id's:\n\n";
      print "@yourids_uc\n\n";

   }

   if (@yourids_lc ne "") {

      print "lower case $serial.'s id's:\n\n";
      print "@yourids_lc\n\n";

   }

print "#--- END OF ID LIST: ---#\n\n";


open (MAILFL, ">>$tmpidfile");

   if (@yourids ne "") {

      print MAILFL "$serial.'s id's:\n\n";
      print MAILFL "@yourids\n\n";

   }

   if (@yourids_uc ne "") {

      print MAILFL "upper case $serial.'s id's:\n\n";
      print MAILFL "@yourids_uc\n\n";

   }

   if (@yourids_lc ne "") {

      print MAILFL "lower case $serial.'s id's:\n\n";
      print MAILFL "@yourids_lc\n\n";

   }


close (MAILFL);


&mailresults;


#--- SUBROUTINES ---#


sub uc2lc_serialconv {

$serial_lc = $serial;

$serial_lc =~ tr/[A-Z]/[a-z]/;

#print ($serial_lc)

}


sub lc2uc_serialconv {

$serial_uc = $serial;

$serial_uc =~ tr/[a-z]/[A-Z]/;

#print ($serial_uc)

}


sub mailresults {

print "Do you want to specify a user to mail the results to? ";
$ans = <STDIN>;

   if ($ans =~ /^[Yy][Ee][Ss]$/) {

      print "You chose an AFFIRMATIVE response!\n\n";

   } else {

      print "You chose a NEGATIVE or INVALID response\n\n";

   }









}


