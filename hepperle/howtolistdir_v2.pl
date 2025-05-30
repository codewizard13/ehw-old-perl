#!/usr/bin/perl
#
# Program:        howtolistdir.pl
# Creator:        Eric Hepperle
# Date:        10/24/01
#
# Purpose:        Simple demonstration of how to list the contents of a directory in perl.
#
############################################

#$dir = "E:/CGI-BIN";
#$dir = "/afs/rchland.ibm.com/usr3/v2cib484/tmp";
$dir = "c:/documents and settings/nunya_beezniss/desktop";


sub error {

   my($error) = @_;

   print("Error: $error\n");

}


opendir(CGIBIN, "$dir") || error("NO: $!\n");
@entries = sort(readdir(CGIBIN)); ### sort the entries like a good kid
closedir(CGIBIN);

print "Reading: $dir/n/n";

print "Dir Test 2/n/n";

foreach $entry (@entries) {

   print("Entry: $entry\n");

}

