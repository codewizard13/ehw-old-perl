#!/usr/bin/perl
#
# Program:	aix_led_errors.pl
# Creator:	Eric Hepperle
# Date:		06/07/01
#
# Purpose:	User enters in an RS6000 trouble code and this program gives the code's meaning.  Is a good example of elsif statements.  It seems to me this file could be written more efficiently if I set it up as a 2 dimensional array.  
#
#####################################################


# if no argument is given or the -h switch is specified or the word "help"
if ($#ARGV < 0 || $ARGV[0] eq '-h' || $ARGV[0] eq 'help') {

  print "Usage:  aix_led_errors [-h]\n";
  exit;

} elsif ($ARGV[0] eq 100) {

   print "AIX LED CODE $ARGV[0] = BIST completed successfully; control was passed to IPL ROS. \n";
   exit;

} elsif ($ARGV[0] eq 102) {

   print "AIX LED CODE $ARGV[0] = BIST started following reset.\n";
   exit;

} elsif ($ARGV[0] eq 103) {

   print "AIX LED CODE $ARGV[0] = BIST could not determine the system model number\n";
   exit;

} else {

   print "Code $ARGV[0] not found!\n";

}

