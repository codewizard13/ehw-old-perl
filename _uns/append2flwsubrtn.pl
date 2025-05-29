#!/usr/bin/perl
# File append2flwsubrtn.pl created by Eric Hepperle at 13:54:37 on Mon Aug 20 2001. 


#$out="c:/scripts/out.txt";
$out = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/cumout.tmp";

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
