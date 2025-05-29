#!/usr/bin/perl
#
# Program:	rdlnprnttest.eh.perl
# Creator:	Eric Hepperle
# Date:		03/21/01
#
# Purpose:	Demonstrates how to read each line in a file with a while loop, and print them to the screen.  This script also contains the 'usage' usage.
#
##################################################

#if ($#ARGV < 0 || $ARGV[0] eq '-h') {
#    print "Usage:  rdlnprnttest [-h]\n";
#    exit;
#}

#***************************************************
# Reads lines from a file and prints them out.
#***************************************************


#if (open (MYFILE, "~v2cib484/tmp/wwwlist.txt") ) {

if (open (MYFILE, "/afs/rchland.ibm.com/usr3/v2cib484/tmp/wwwlist.txt") ) {

   $line = <MYFILE>;

   while ($line ne "") {

      print ($line);

      $line = <MYFILE>;

      
   }

}


