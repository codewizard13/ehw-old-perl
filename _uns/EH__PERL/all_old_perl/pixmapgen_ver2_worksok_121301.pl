#!/usr/bin/perl
#
#
# Program:	pixmapgen_ver2_worksok_121301.pl
# Creator:	Eric Hepperle
# Date:		12/12/01
#
# Purpose:	Will create a table of rowlength = 6, and row count = total pix count / 6, and if there is a remainder, add one.  This is an on the fly picture map generator.
#
###################################################
#
# Revisions:
#
#	12/12/01 - Original.
#
#	12/13/01 - Last updated.  Partially working.
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

$picurls = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/picurltest.ez";


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

# get remainder:
$remainder = $count % $columns;

# Tracing:
print "<BR><BR>remainder = $remainder<BR><BR>\n\n";

print "<BR>rows = count/columns = $rows\n\n";


if ($rows < 6) {

   $rows = 1;

}

print "<BR>rows = count/columns = $rows\n\n";



# Make table:
#
# each cell has a h/w ratio of 4/3.

$wd = 90;

$ht = 120;


print "<HTML>\n\n";
print "<HEAD>\n";
print "<TITLE>PIXMAPGEN ON-THE-FLY:  $rows rows X $columns cols.</TITLE>\n";
print "</HEAD>\n\n";
print "<BODY BGCOLOR = BLACK TEXT = LIME >\n\n";

print "<BR><BR>\n";
print "Just Testing.<BR><BR>\n\n\n";

$count1 = 1;

# make table.
print "<TABLE BORDER = 2>\n\n";

# read each url in pix url file.
foreach $picurl (@picurlfile) {

   # remove newline char from $picurl.
   chomp $picurl;

  
   print "<!-- COUNT = $count1 -->\n";
   print "<!-- ROW # $count1 -->\n";

   print "<TR>\n";

   for (1..$rows) {

      print "<TD WIDTH = $wd HEIGHT = $ht ALIGN = CENTER><IMG SRC = \"$picurl\" ALT = \"$picurl\">\n";
      print "<A HREF = \"$picurl\"></A>\n";
      print "</TD>\n";
      
   }

   print "</TR>\n";

   print "\n";




   # increment count by 1.
   $count1++;

}


print "</TABLE>\n";
print "</BODY>\n";
print "</HTML>\n";
