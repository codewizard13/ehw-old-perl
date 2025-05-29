#!/usr/bin/perl
#
#
# Program:	pixmapgen.pl
# Creator:	Eric Hepperle
# Date:	12/12/01
#
# Purpose:	Will create a table of rowlength = 6, and row count = total pix count / 6, and if there is a remainder, add one.  This is an on the fly picture map generator.
#
# NOTE:		You must rename the file extension
#		to "acgi" for secure access, or
#		cgi for non-secure.  Also, you
#		must copy this file to your cgi-bin
#		dir.
#
###################################################
#
# Revisions:
#
#	12/12/01 - Original.
#
#	12/13/01 - Last updated.  Partially working.
#
#		 - FINAL VERSION:
#
#
#		   !!!!  WORKS GREAT  !!!!!
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "Content-type: text/html\n\n";
# mandatory cgi header:

# OPEN HTML HEADER.
print "<HTML>\n\n";

# spacer in page.
print "<BR>\n\n";

###################################################
# INITIALIZE AND DEFINE VARIABLES:                #
###################################################

# assign the $0 (filename) string to a scalar var.
$progname = $0;

# initialize count variable.
$count = 1;

# define file to get pix urls from.
$picurls = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/picurltest.ez";

# initialized colrmndr (remainder) value.
$colrmndr = 1;

# define how many items per row (cols.).
$columns = 6;

# initialize rowcount var.
$rowcount = 1;

#------------------------------------------------#
# Define cell dimensions.
# (each cell has a h/w ratio of 4/3.)
#
$ht = 120;
$wd = 90;


# store contents of the file in an array.
open (FILE, "$picurls");
   @picurlfile = <FILE>;
close (FILE);


# get the total pic count:
foreach $picurl (@picurlfile){
   $pixttl++;
}

# tell user name of this cgi program.
print "This program is called $progname<BR><BR>\n";


# Tracing:
print "pixttl = $pixttl<BR>\n\n";


#------------------------------------------------#
# calculate number of rows needed:
#
if ($pixttl < 6) {

   $rows_org = 1;

   # define remainder.
   $remainder = $pixttl % $columns;

   # define rows_fin.
   $rows_fin = $rows_org;

} else {

   # NOTE:	To truncate a number, use the
   #		"int" function.
   #
   #		Visit the following web page for
   #		list of all functions:
   #
   #		http://www.perldoc.com/perl5.6/pod/perlfunc.html

   $rows_org = int($pixttl/$columns);

   # define remainder.
   $remainder = $pixttl % $columns;


   # if there are more than 6 pix,
   # check for remainder value ...
   if ($remainder != 0) {

      $rows_fin = $rows_org + 1;

   }


}


# Tracing:
print "rows_org = $rows_org<BR>\n";
print "remainder = $remainder<BR>\n";
print "rows_fin = $rows_fin<BR>\n\n";


# Found the web page.
print "<HEAD>\n";
print "<TITLE>PIXMAPGEN ON-THE-FLY:  $rows_fin rows X $columns cols.</TITLE>\n";
print "</HEAD>\n\n";
print "<BODY BGCOLOR = BLACK TEXT = LIME >\n\n";

print "<BR><BR>\n";
print "Just Testing.<BR><BR>\n\n\n";



###################################################
# MAKE TABLE:                                     #
###################################################
#

# BEGIN TABLE HEADER.
print "<TABLE BORDER = 2>\n\n";


      # print row header
      print "<!-- ROW # $rowcount -->\n";

      # OPEN ROW TAG.
      print "<TR>\n";


      # read each url in pix url file and ...
      foreach $picurl (@picurlfile) {

         # remove newline char from $picurl.
         chomp $picurl;

         # calculate remainder.
         $colrmndr = $count % $columns;


         #------------------------------------------------#
         # !!!!!  This part is CRUCIAL  !!!!!
         #
         # if the number of the count is divisible
         # by the specified number of columns ...
         #
         if ($colrmndr == 0) {

            # end row.
            print "</TR>\n\n";

            # increment rowcount by 1.
            $rowcount++;

            # start new row.
            print "<!-- ROW # $rowcount -->\n";        
            print "<TR>\n";

         }


         #------------------------------------------------#
         # Create Cell:
         #
         # NOTE:  Use the IMG SRC height and width attributes
         #        to dictate the dimensions that the graphics
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

  print "\n";


# CLOSE OUT OPEN HTML HEADERS.
print "</TABLE>\n";
print "</BODY>\n";
print "</HTML>\n";
