#!/usr/bin/perl
#
#
# Program:	pixmapgen_r3_workspixrtsz_121301.pl
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


print "<HTML>\n\n";


print "<BR>\n\n";
print "<BR>This program is called pixmapgen.pl\n";
print "<BR>\n";

# initialize count variable.
$count = 0;

$picurls = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/picurltest.ez";

# initialized nextrow (remainder) value.
$nextrow = 1;

# store contents of the file in an array.
open (FILE, "$picurls");
   @picurlfile = <FILE>;
close (FILE);


# get the total pic count:
foreach $picurl (@picurlfile){

   $pixttl++;

}

# Tracing:
print "<BR>pixttl = $pixttl\n\n";

$columns = 6;

$rows = ($pixttl/$columns);

# get remainder:
$remainder = $pixttl % $columns;

# Tracing:
print "<BR><BR>remainder = $remainder<BR><BR>\n\n";

print "<BR>rows = pixttl/columns = $pixttl/$columns = $rows\n\n";


# if there are less than six pictures then $rows = 1.
if ($pixttl < 6) {

   $rows = 1;

}

# Tracing:
print "<BR>rows = pixttl/columns = $rows\n\n";


# Define cell dimensions.
#
# (each cell has a h/w ratio of 4/3.)
#
$wd = 90;

$ht = 120;


print "<HEAD>\n";
print "<TITLE>PIXMAPGEN ON-THE-FLY:  $rows rows X $columns cols.</TITLE>\n";
print "</HEAD>\n\n";
print "<BODY BGCOLOR = BLACK TEXT = LIME >\n\n";

print "<BR><BR>\n";
print "Just Testing.<BR><BR>\n\n\n";

#$count1 = 1;



# make table.
print "<TABLE BORDER = 2>\n\n";

# read each url in pix url file and ...
foreach $picurl (@picurlfile) {

   # remove newline char from $picurl.
   chomp $picurl;


} # END FOREACH PICURL LOOP.



   # For rows 1 to $rows ... 
   for (1..$rows) {

      # print row header
      print "<!-- COUNT = $count -->\n";
      print "<!-- ROW # $count -->\n";

      # OPEN ROW TAG.
      print "<TR>\n";


      while ($nextrow != 0) {

         # read each url in pix url file and ...
         foreach $picurl (@picurlfile) {

            # remove newline char from $picurl.
            chomp $picurl;

            # calculate remainder.
            $nextrow = $count % $columns;

            # Tracing:
            print "<BR><BR>nextrow = $nextrow<BR><BR>\n\n";

            # create one cell.
            #
            # NOTE:  Use the IMG SRC height and width attributes
            #	     to dictate the dimensions that the graphics
            #        should be displayed in the table.
            #
            print "<TD WIDTH = $wd HEIGHT = $ht ALIGN = CENTER><IMG SRC = \"$picurl\" HEIGHT = $ht WIDTH = $wd ALT = \"$picurl\">\n";
            print "<A HREF = \"$picurl\"></A>\n";
            print "</TD>\n";

            # increment count by 1.
            $count++;

	 } # END FOREACH PICURL LOOP.


      # CLOSE ROW TAG.
      print "</TR>\n";



      } # END WHILE LOOP.



   } # END FOR LOOP.


   print "\n";


   


   # increment count by 1.
#   $count++;




print "</TABLE>\n";
print "</BODY>\n";
print "</HTML>\n";
