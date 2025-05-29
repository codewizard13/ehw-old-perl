#!/usr/bin/perl
# File rdlnprnttest.eh.perl created by Eric Hepperle at 14:00:26 on Wed Mar 21 2001. 

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


