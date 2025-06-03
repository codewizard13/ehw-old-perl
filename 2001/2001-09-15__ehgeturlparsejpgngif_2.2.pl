#!/usr/bin/perl -w
#
# Program:	ehgeturlparsejpgngif_2.1.pl
# Creator:	Eric Hepperle
# Date:	09/15/01
#
# Purpose:	Rips the source code of any url and
#		stores it as an html doc. Then takes
#		the stored code and downloads a new
#		copy periodically and compares them.
#		if there are changes, they are
#		recorded in a log file.  Any links are
#		recorded in a link log file, and any
#		jpg or gif links are downloaded to a
#		pix folder.
#
#
#
#########################################
#
# Planned Improvements and Additions:
# ----------
# 
# 1)  Grep the source code (after download) for
#     jpg and gif files.  may need use of border
#     structure.
#
# 2)  Use a chron-like function to periodically
#     (user defined intervals) check the
#     host site for changes.  For instance, it
#     might be set to check for updates every 5minutes.
#     If it finds the page has changed, it will
#     then look for new strings that match the
#     following:
#
#     "//:", "html", ".jpg", ".gif".
#
#########################################


use LWP::Simple;

print "\n";



#########################################
# DEFINE DIRECTORIES AND FILES:
#########################################
#

# Set HTML doc storage directory.
$destdir_main = "c:/windows/desktop/eh_ripped_htmldocs";

# Set Pictures file directory.
$pixdir = "$destdir_main/eh_rippedhtml_pix";

# Set HTML doc filename.
$webfile ="$destdir_main/$docname";

# Set Change Log filename.
$htmlchangelog = "$destdir_main/eh_rippedhtml_changelog.txt";




#########################################
# PRINT HEADER INFO:
#########################################
#
print "----------------------------------------\n";
print "This program gets the source code of any url entered.\n";
print "\n";



#########################################
# GET INFO FROM USER:
#########################################
#
print "Enter a url to retrieve: ";
$url = <STDIN>;
#chomp $url;
print "\n\n";

# Tracing:
print "The requested url = \n";
print "$url\n";

print "Enter the name to give the resulting html document: \n";
print "(the program automatically adds \".html\" to the name)\n";
$docname = <STDIN>;
chomp $docname;

#------------------------------------------
# create html document actual name.
#
$docname = $docname.".html";
# another way to do this is:
#    $docname = "$docname\.html";
#


#########################################
# READ OLD CODE INTO MEMORY:
#########################################
#

#&readoldcodetofile2;


#----------------------------------------
# Assign the url to a variable:
$file = get ($url);

print "The url is: \n";
print "$url \n";
print "\n";

print "----------------------------------------\n";
print "\n";

print "The source code of the url is: \n";
print "\n";
print "----------------------------------------\n";
print "\n";
print "$file\n";

print "\n";


#########################################
# VERIFY CODE:
#########################################
#

# Print Ripped HTML Page Code to Screen:
#
open (WEBDOC, ">$webfile") || die ("cannot open input file $webfile \n");

   print WEBDOC "<HTML>This is the code ripped from $url: \n";
   print WEBDOC "----------------------------------------\n";

   # This is the line that writes the ripped html code to
   # the newly created html doc.
   #
   print WEBDOC $file;

   # Set webfile equal to an array variable:
   @rippedcode = <WEBDOC>;


close (WEBDOC);


#-------------------------------------
# define tracing testfile:
$testfile = "$destdir_main/testfile.txt";

open (TESTFILE, ">$testfile");

   print TESTFILE "The url is: \n";
   print TESTFILE "$url \n";
   print TESTFILE "\n";

   print TESTFILE "----------------------------------------\n";
   print TESTFILE "\n";

   print TESTFILE "The source code of the url is: \n";
   print TESTFILE "\n";
   print TESTFILE "----------------------------------------\n";
   print TESTFILE "\n";
   print TESTFILE "$file\n";

   print TESTFILE "\n";

   print TESTFILE "Begin RIPPED CODE HERE:\n";
   print TESTFILE "=============================================\n\n";

   print TESTFILE "(@rippedcode)\n";

   print TESTFILE "=============================================\n\n";

   print TESTFILE "#------*---*------#\n";
   print TESTFILE "#  THE END !!!!!   #\n";

close (TESTFILE);



#########################################
# SUBROUTINES:
#########################################
#


sub readoldcodetofile2 {

   # if oldcode file doesn't exist...
   if ( ! -e $file ) {

      # tell user.
      warn "$program: $file not found\n";

      next;

   } else {

      # ... then open the file for read only access!
      open (OLDCODE, "$webfile") || die "cannot open file: $webdoc : $!\n";

         # store contents of oldcode in an array.
         @oldcode = <OLDCODE>;

      close (OLDCODE);

      # Set oldcode file name:
      $oldcode_file = "$destdir_main/oldcodefile.txt";

      open (OCFILE, ">$oldcode_file") || die "cannot open file: $oldcode_file :$!\n";

         print OCFILE @oldcode;

      close (OCFILE);

}


#----------
# Keep DOS window from closing until user hits enter.
$hold = <STDIN>;
