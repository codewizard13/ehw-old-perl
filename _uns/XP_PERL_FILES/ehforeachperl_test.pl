#!/usr/bin/perl
# File ehforeachperl_test.pl created by Eric Hepperle at 07:42:27 on Wed Sep  5 2001. 
#
# Program:	ehforeachperl_test.pl
# Creator:	Eric Hepperle
# Date:	09/05/01
#
# Purpose:	Demonstrates reading lines from a file using a foreach loop.

#$destfile = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/desttextfile1.ez";
#$testfile = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/testtextfile1.ez";
$destdir = "c:/documents and settings/nunya_beezniss/desktop";
$destfile = "$destdir/desttextfile1.txt";
$testfile = "c:/windows/comsetup.log";

# NOTE: I found out the hard way; you must use full path when defining
#	pathname variables. Do not use the tilde "~".
#
#	You can change this file name.

open (TEST, "$testfile");

open (DEST, ">$destfile");

   @test = <TEST>;

   $count = 1;

   foreach $line (@test){

      print "line $count:	$line\n";

      $wonl = $line;

      substr($wonl, 0) =~ s/\n/<BR>/g;

      print "converted $count:	$wonl\n";
      print DEST "$wonl\n";

      $count++;

   }



close (DEST);

close (TEST);


#-----
$hold = <STDIN>;
