#!/usr/bin/perl
#
#
# Program:        pixmapgen_v7_home.pl
# Creator:        Eric Hepperle
# Date:        03/17/02
#
# Purpose:        Will create a table of rowlength = 6, and row count = total pix count / 6, and if there is a remainder, add one.  This is an on the fly picture map generator.
#
# NOTE:                You must rename the file extension
#                to "acgi" for secure access, or
#                cgi for non-secure.  Also, you
#                must copy this file to your cgi-bin
#                dir.
#
###################################################
#
# Revisions:
#
#        12/12/01 - Original.
#
#        12/13/01 - Last updated.  Partially working.
#
#                 - FINAL VERSION:
#
#
#                   !!!!  WORKS GREAT  !!!!!
#
#        02/14/02 - This is the home version.
#                   - Added code to create hard copy
#                     of resulting page.
#                   - Added code to choose source file.
#                   - Added code for choosing number of
#                     rows and columns.
#
#        03/17/02 - Added code to make bgcolor black,
#                     and to center the table
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

# define file to get pix urls from (DEFAULT).
$picurls = "d:/speshal012102/speshal012102/SPESHAL_HC";

# initialized colrmndr (remainder) value.
$colrmndr = 1;

# define how many items per row (cols.).
$columns = 6;

# initialize rowcount var.
$rowcount = 1;

# define main dir
$mainDir = "c:/documents and settings/nunya_beezniss/desktop";

# define hard file.
$hardfile = "$mainDir/pixmap_hardfile.html";

#------------------------------------------------#
# Define cell dimensions.
# (each cell has a h/w ratio of 4/3.)
#
$ht = 216;
#$wd = 288;
$wd = 162;





###################################################
# GET USER INPUT:                                 #
###################################################

# ask for source file:
print "Enter the path to the folder housing the pix: \n\n";
$folderpath = <STDIN>;
chomp $folderpath;
print "\n\n";

# verify path to user:
print "THE SOURCE PATH IS: \n\n";
print "$folderpath\n\n";


print "Press any key to continue ...";
$hold = <STDIN>;

# if no folderpath entered use DEFAULT.
if ($folderpath ne "") {
   $picurls = $folderpath;
}


# Ask user for table dimensions:
print "Now you may choose the dimentions of the table that\n";
print "will be displayed; the default is [6 columns x infinite rows]\n\n";
print "How many columns? ";
$ans = <STDIN>;
chomp $ans;
if ($ans ne "") {
   $columns = $ans;
}






# Store contents of source file in an array.
#open (FILE, "$picurls");
#   @picurlfile = <FILE>;
#close (FILE);

opendir (PICDIR, $picurls);
   @picurlfile = readdir(PICDIR);
   #
   # add full path to pic name.
   foreach $picurl (@picurlfile) {
      chomp $picurl;
      @fullpaths = (@fullpaths, "$folderpath/$picurl");
   }
close (PICDIR);

# rename @fullpaths to @picurlfile.
@picurlfile = @fullpaths;

# get the total pic count:
foreach $picurl (@picurlfile){
   #
   # TRACING:
   print "\$picurl[$count]:\n";
   print "$picurl\n";
   $pixttl++;
}
$hold = <STDIN>;

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

   # NOTE:        To truncate a number, use the
   #                "int" function.
   #
   #                Visit the following web page for
   #                list of all functions:
   #
   #                http://www.perldoc.com/perl5.6/pod/perlfunc.html

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


# Begin creation of cgi output web page:
print "<HEAD>\n";
print "<TITLE>PIXMAPGEN ON-THE-FLY:  $rows_fin rows X $columns cols.</TITLE>\n";
print "</HEAD>\n\n";
print "<BODY BGCOLOR = BLACK TEXT = LIME >\n\n";

print "<BR><BR>\n";
print "Just Testing.<BR><BR>\n\n\n";



###################################################
# MAKE CGI TABLE:                                 #
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




###################################################
# MAKE HARD FILE TABLE:                                     #
###################################################
#

# open hard file for write.
open (HARD, ">$hardfile");

# WRITE STANDARD HTML TAGS TO HARD FILE.
print HARD "<HTML>\n\n";
print HARD "<HEAD>\n";
print HARD "<TITLE>PIXMAP: [$folderpath]</TITLE>\n";
print HARD "</HEAD>\n\n";
print HARD "<BODY BGCOLOR = BLACK TEXT = LIME LINK = MAROON>\n\n";

# BEGIN TABLE HEADER.
print HARD "<CENTER>\n";
print HARD "<TABLE BORDER = 2>\n\n";


      # print row header
      print HARD "<!-- ROW # $rowcount -->\n";

      # OPEN ROW TAG.
      print HARD "<TR>\n";


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
            print HARD "</TR>\n\n";

            # increment rowcount by 1.
            $rowcount++;

            # start new row.
            print HARD "<!-- ROW # $rowcount -->\n";
            print HARD "<TR>\n";

         }


         #------------------------------------------------#
         # Create Cell:
         #
         # NOTE:  Use the IMG SRC height and width attributes
         #        to dictate the dimensions that the graphics
         #        should be displayed in the table.
         #
         print HARD "<A HREF = \"$picurl\">\n";
         print HARD "<TD WIDTH = $wd HEIGHT = $ht ALIGN = CENTER><IMG SRC = \"$picurl\" HEIGHT = $ht WIDTH = $wd ALT = \"$picurl\">\n";
         print HARD "<br><FONT SIZE = 1>$picurl</FONT>\n";
         print HARD "</A>\n";
         print HARD "</TD>\n";



         # increment count by 1.
         $count++;

      } # END FOREACH PICURL LOOP.

      # CLOSE ROW TAG.
      print HARD "</TR>\n";

  print HARD "\n";


# CLOSE OUT OPEN HTML HEADERS.
print HARD "</TABLE>\n";
print HARD "</CENTER>\n";
print HARD "</BODY>\n";
print HARD "</HTML>\n";

# close HARD file.
close (HARD);


#system("explorer $hardfile");

print "Press Any Key to Quit";
$hold = <STDIN>;