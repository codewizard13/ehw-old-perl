#!/usr/bin/perl
#
#
# Program:	pixmapgen.pl
# Creator:	Eric Hepperle
# Date:	12/12/01
#
# Purpose:	Will create a table of rowlength = 6, and row count = total pix count / 6, and if there is a remainder, add one.  This is an on the fly picture map generator.
#
###################################################
#
# Revisions:
#
#	- Original:  12/12/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "Content-type: text/html\n\n";
# mandatory cgi header:


print "<BR>\n\n";
print "<BR>This program is called pixmapgen.pl\n";
print "<BR>\n";

$count = 0;

$picurls = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/picurltest.txt";


# store contents of the file in an array.
open (FILE, "$picurls");
   @picurlfile = <FILE>;
close (FILE);


# get the total pic count:
foreach $picurl (@picurlfile){

   $count++;

}

# Tracing:
print "<BR>count = $count\n\n";

$columns = 6;

$rows = ($count/$columns);


print "<BR>rows = count/columns = $rows\n\n";


if ($rows < 6) {

   $rows = 1;

}

print "<BR>rows = count/columns = $rows\n\n";



# Make table:
#
$wd = 30;

$ht = 40;


print "<HTML>\n\n";
print "<HEAD>\n";
print "<TITLE>PIXMAPGEN ON-THE-FLY:  $rows rows X $columns cols.</TITLE>\n";
print "</HEAD>\n\n";
print "<BODY BGCOLOR = BLACK TEXT = LIME >\n\n";

print "<BR><BR>\n";
print "Just Testing.<BR><BR>\n\n\n";

print "</BODY>\n";
print "</HTML>\n";
