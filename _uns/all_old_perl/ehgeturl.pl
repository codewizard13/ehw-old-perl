#!/usr/bin/perl -w
#
# Program:	ehgeturl.pl
# Creator:	Eric Hepperle
# Date:		05/23/01
#
# Purpose:	This program will rip the source code of any url. It will now also save the source as an html document in a specified folder.
#
#######################################################

use LWP::Simple;

print "\n";

print "This program gets the source code of any url entered.\n";
print "\n";

print "Enter a url to retrieve: ";
$url = <STDIN>;

print "\n";

print "Enter the name to give to the resulting html document: \n";
$docname = <STDIN>;
chomp $docname;

$docname = $docname.".html";
#$docname = "$docname\.html";

$file = get("$url");

print "The url is $url \n";
print "\n" ;

print "The contents of the url are: \n";
print $file;

print "\n";

print "The \$docname = $docname\n";
print "\n";


$dir = "/afs/rchland.ibm.com/usr3/v2cib484/ehtestdir";
$webfile = "$dir/$docname";



open (WEBDOC, ">$webfile") || die "cannot open output file $webfile \n";

    print WEBDOC "The following should be HTML! \n";

    # This is the line that prints the html source code to file.
    print WEBDOC $file;

close (WEBDOC);




#----------
$hold = <STDIN>;
