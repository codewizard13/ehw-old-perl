#!/usr/bin/perl -w
#
# Program:	ehgeturlparsejpgngif_3.pl
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
#########################################
#
# NOTE:	THIS IS A WORKING VERSION.
#
#########################################
#
# Revisions:
#
#	09/15/01
#	  - Edited script so it creates an html
#	    index page with the name and
#	    corresponding url.
#	  - 
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

#########################################
# PRINT HEADER/DISCLAIMER:
#########################################
#

print "\n";
print "----------------------------------------\n";
print "This program gets the source code of any url entered.\n";
print "\n";


#########################################
# GET INPUT FROM USER:
#########################################
#

# get url.
print "Enter a url to retrieve: ";
$url = <STDIN>;
chomp $url;
print "\n";

# Tracing:
print "The requested url = \n";
print "$url\n";

# get desired result webpage name.
print "Enter the name to give the resulting html document: \n";
print "(the program automatically adds \".html\" to the name)\n";
$docname = <STDIN>;
chomp $docname;

# append .html to $docname.
$docname = $docname.".html";
# another way to do this is:
#    $docname = "$docname\.html";
#

# This is the line that retrieves the html code.
$file = get ($url);


#########################################
# GET OLDFILE INFO:
#########################################
#


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


# Set HTML doc storage directory.
$destdir_main = "c:/windows/desktop/eh_ripped_htmldocs";

$webfile ="$destdir_main/$docname";

&getoldfile;
sub getoldfile {

   # whatever you want to name the newfile, that will
   # be the name of the oldfile to check for, as well.
   #
   $oldfile = $webfile;

   # if oldfile doesn't exist.
   if (! -e $oldfile) {

      print "The file $oldfile does not exist\n";
      $hold = <STDIN>;

   } else {

     
     print "The file does exist\n\n";
         
  }

}


&createnewfile;
sub createnewfile {

   # create newfile:
   #
   open (WEBDOC, ">$webfile") || die "cannot open input file $webfile \n";

      print WEBDOC "FILENAME: <FONT COLOR = \"#000099\"><B><U>$docname</U></B></FONT><BR>\n";
      print WEBDOC "This is the code I ripped from <B>$url<B>:<BR> \n";
      print WEBDOC "<HR></HR><BR>\n";

      # This is the line that writes the ripped html code to
      # the newly created html doc.
      #
      print WEBDOC $file;

   close (WEBDOC);

   unless (open (NEWFILE,"$webfile"));

      die ("cannot open input file $webfile\n");

   }

   @newfile = <NEWFILE>;
          
}


&editindexlog;
# This sub works.
sub editindexlog {

   $indexlog = "$destdir_main/stored_webpage_index.html";

   if (! -e $indexlog) {

      open (INDEX, ">>$indexlog");

         print INDEX "<HTML>\n";
         print INDEX "<TABLE BORDER = 2>\n";
         print INDEX "<TR><TH FONT SIZE = 6 COLOR = RED ALIGN = CENTER WIDTH = 200>STORED PAGE NAME</TH>\n";
         print INDEX "<TH FONT SIZE = 6 COLOR = RED ALIGN = CENTER WIDTH = 500>ACTUAL URL</TH></TR>\n";
         print INDEX "</TABLE>\n";

     close (INDEX);

   }


   open (INDEX, ">>$indexlog");

      print INDEX "<HTML><HEAD><TITLE>STORED WEB PAGE INDEX\n";
      print INDEX "</TITLE></HEAD>\n";
      print INDEX "<BODY ALINK = BLUE VLINK = BLUE>\n";
      print INDEX "<TABLE BORDER = 2>\n";
      print INDEX "<TR>\n";
      print INDEX "<TD WIDTH = 200>$docname</TD>\n";
      print INDEX "<TD WIDTH = 500><A HREF = \"$url\" TARGET = TOP>$url </A></TD>\n";
      print INDEX "</TR>\n";
      print INDEX "</TABLE>\n";
      print INDEX "</BODY></HTML>\n\n";

   close (INDEX);

}




&compareoldtonew;

#---------

sub compareoldtonew {

   # define file that holds any changes.
   $changelog = "$destdir_main/changelog.txt";

   open (OLDFILE,"$webdoc") || die ("cannot open input file $webdoc\n");

      @oldfile = <OLDFILE>;
   
   close (OLDFILE);       

 }





#----------
$hold = <STDIN>;