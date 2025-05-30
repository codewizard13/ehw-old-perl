#!/usr/bin/perl -w
#
# Program:	ehgeturlparsejpgngif.pl
# Creator:	Eric Hepperle
# Date:		06/27/01
#
# Purpose:	Rips the source code of any url and
#		stores it as an html doc.
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
$destdir = "c:/windows/desktop/eh_ripped_htmldocs";

$webfile ="$destdir/$docname";

open (WEBDOC, ">$webfile") || die "cannot open input file $webfile \n";

   print WEBDOC "<HTML>This is the code ripped from $url: \n";
   print WEBDOC "----------------------------------------\n";

   # This is the line that writes the ripped html code to
   # the newly created html doc.
   #
   print WEBDOC $file;

close (WEBDOC);

#---------






#----------
$hold = <STDIN>;