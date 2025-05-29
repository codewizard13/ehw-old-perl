#!/usr/bin/perl
#
# Program:	ehforeachperl_test.pl
# Creator:	Eric Hepperle
# Date:		09/05/01
#
# Purpose:	Demonstrates reading lines from a file using a foreach loop.
#
############################################


$destfile = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/desttextfile1.ez";
$testfile = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/testtextfile1.ez";
#
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



