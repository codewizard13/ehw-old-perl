#!/usr/bin/perl
# File ehgeturlparsejpgngif.perl created by Eric Hepperle at 14:42:02 on Wed Jun 27 2001.
#
# This program will rip the source code of any url. It will now also
# save the source as an html document in a specified folder.  It only downloads text (HTML), not the corresponding images.
#

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


# Open the file webdoc and parse for jpg or gif:
#
print "I will now open the saved html page \"$webfile\" and search for\n";
print "any jpg or gif file listings.\n";
print "";


open (WEBDOC, "$webfile") || die "cannot open output file $webfile \n";

    @webdoc = <WEBDOC>;

    print "---------------------------------------------\n";
    print "The text of the the html file $webfile is: \n";
    print "\n";

    print (@webdoc);


    print "---------------------------------------------";
    print "\n";

    $result = (@webdoc) =~ /jpg/;

    print "\$result = $result";

    print "\n";

    

    


close (WEBDOC);

# Keep window open in dos mode
$hold = <STDIN>;
