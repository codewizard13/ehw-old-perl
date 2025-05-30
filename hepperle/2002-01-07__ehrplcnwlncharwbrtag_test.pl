#!/usr/bin/perl
#
# Program:	ehrplcnwlncharwbrtag_test.pl
# Creator:	Eric Hepperle
# Date:		08/28/01
#
# Purpose:	Converts/Replaces new line characters to <BR> html sequence.  Uses source and destination files.
#
############################################################3



$htmltempsrc = "/afs/rchland.ibm.com/usr3/v2cib484/temp_html_src.html";
$htmltempdest = "/afs/rchland.ibm.com/usr3/v2cib484/temp_html_dest.html";

# erase previous contents of source file.
#
#open (HTMLTMP, ">$htmltempsrc");
#print HTMLTMP "#\n";
#close (HTMLTMP);


# open sourcefile and write 3 lines to it.
#
open (HTMLTMP, ">$htmltempsrc");

   print HTMLTMP "This is a temporary\n";
   print HTMLTMP "\n";
   print HTMLTMP "HTML file\n";

close (HTMLTMP);



&rdlnsfrfilenprtwysiwyg;







#--- SUBROUTINES ---#

#*************************************************
# Read lines from a text file and replace
# newline characters w/ the <br> html tag.
#
sub rdlnsfrfilenprtwysiwyg {


   if (open (SRCFL, "$htmltempsrc")) {

       $line = <SRCFL>;

           while ($line ne "") {

              # replace new line chars w/ the <br> char.
              # wonl = "without new line".
  	      #
              $wonl = $line;

              substr($wonl, 0) =~ s/\n/<BR>/g;

	      print "<!-- ONE TIME ------------------------>\n";
	      print "This is the original line: $line\n";
              print "This is the line after processing: $wonl\n";
	      print "\n";

	      open (DESTFL, "$htmltempdest");

	         print DESTFL "<!-- ONE TIME ------------------------>\n";
	         print DESTFL "This is the original line: $line\n";
                 print DESTFL "This is the line after processing: $wonl\n";
	         print DESTFL "\n";

	      close (DESTFL);

	      $line = <SRCFL>;

          }

   }

}


       
