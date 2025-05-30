#!/usr/bin/perl
# File eh_simmatchhtml.pl created by Eric Hepperle at 15:27:29 on Thu Sep 20 2001. 
#
# Program:	eh_simmatchhtml.pl
# Creator:	Eric Hepperle
# Date:		09/20/01
#
# Purpose:	Pulls urls out of text (not html links)
#		and writes them to a file, then opens the
#		file in a new browser window.
#
#	WORKS GREAT !!!
#
######################################################

#$srchptrn = "http://";
$srchptrn = "http:\/\/";
#$srchptrn = "s#.*(http://.*)\s.*#\1#i";
print "\$srchptrn = $srchptrn\n\n";



$infile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/ehtestdoc_urlsintext.txt";

open (INFILE, "$infile");

   @infile = <INFILE>;

close (INFILE);


#print "@infile";

$outfile = "outfile.tmp";

open (OUTFILE, ">>$outfile");

   print "\n";

   foreach $line (@infile){



      if ($line =~ /($srchptrn)/) {

         #$MATCH = $1;
         print "\$MATCH = $MATCH\n";

print "last successful pattern match was:\n";
print "$&\n\n";

         print "\$match = $match\n\n";

         print "$line is a url!\n";
         print OUTFILE $line;

      }

   }

   print "\n\n";

close (OUTFILE);


#system ("netscape $outfile");


print "$<\n\n";
print "$>\n\n";
print "$0\n\n";


$hold = <STDIN>;
