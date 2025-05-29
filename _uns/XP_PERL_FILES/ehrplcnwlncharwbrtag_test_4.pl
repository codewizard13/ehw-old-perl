#!/usr/bin/perl
# File ehrplcnwlncharwbrtag_test.pl created by Eric Hepperle at 13:27:21 on Tue Aug 28 2001. 
#
# Program:	ehrplcnwlncharwbrtag_test_4.pl
# Creator:	Eric Hepperle
# Date:		09/05/01
#
# Purpose:	Converts/Replaces new line characters to <BR> html sequence.  Uses source and destination files.
#
#
###################################################
#
# Improvements:
#
#	- 09/04/01 Improved Commenting.
#
#	- 09/05/01 Developed 3 other versions; this
#		   is the one that works!
#
###################################################
#



# define source and destination file variables:
#
$htmltempsrc = "/afs/rchland.ibm.com/usr3/v2cib484/temp_html_src.html";
$htmltempdest = "/afs/rchland.ibm.com/usr3/v2cib484/temp_html_dest.html";

# open sourcefile and write 3 lines to it.
# NOTE: Make sure to use the write ">" character;
#	DO NOT USE APPEND HERE !!!
#
open (HTMLTMP, ">$htmltempsrc");

   print HTMLTMP "........................................\n";
   print HTMLTMP "one fish, two fish\n";
   print HTMLTMP "\n";
   print HTMLTMP "red fish, blue fish\n";
   print HTMLTMP "........................................\n";

close (HTMLTMP);


#--------------------------------
&cnvrtnl2brnwrite2destfl;


#--- SUBROUTINES ---#

#*************************************************
# Read lines from a text file and replace
# newline characters w/ the <br> html tag.
# Converted code will display correctly in
# webpages.
#
sub cnvrtnl2brnwrite2destfl {

   # If opening this file is successful, then ...
   open (SRCFL, "$htmltempsrc");

	       # open destination file to write revised
	       # code to.
	       #
	       open (DEST, ">$htmltempdest");

	       # store contents of source file in an
	       # array variable for manipulation.
	       #
	       @source = <SRCFL>;

	       # initialize a count variable.
	       #
	       $count = 1;

	       # read each line in the source file.
	       foreach $line (@source){

		   # print formatted results to screen
		   # so I know the script worked.
		   #
		   print "line $count:	$line\n";

		   # assign the value of $line to new
		   # var so the orig $line value stays
		   # intact.
		   #
		   $wonl = $line;

		   # replace newline chars in new var w/
		   # the <BR> html tag, then reassign
		   # new var.
		   #
		   substr($wonl, 0) =~ s/\n/<BR>/g;

		   # print formatted results to screen
		   # so I know the script worked.
		   #
		   print "converted $count:	$wonl\n";
		   print DEST "$wonl\n";

		   # Increment count.
		   $count++;

	       }

	       # Close the destination file.
	       close (DEST);

   # Close the source file.      
   close (SRCFL);


}



