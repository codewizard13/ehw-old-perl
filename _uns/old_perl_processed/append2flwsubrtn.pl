#!/usr/bin/perl
#
# Program:        append2flwsubrtn.pl
# Creator:        Eric Hepperle
# Date:                08/20/01
#
# Purpose:        Simple demonstration of appending a string to a text file, then printing entire file to screen.  Also demonstrates syntax for getting system time.
#
###################################################


$out="c:/documents and settings/nunya_beezniss/desktop/out.txt";
#$out = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/cumout.tmp";

open (OUT, ">>$out");

  print OUT "\n";

close (OUT);



&printfile;

open OUT, ">>$out" or die "Cannot open $out for append :$!";

print OUT 'The time is now : ',scalar(localtime),"\n";

close OUT;

&printfile;



sub printfile {

        open IN, $out or die "Cannot open $out for read :$!";

           while (<IN>) {

           print;

           }

        close IN;
}