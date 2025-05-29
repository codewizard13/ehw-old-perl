#!/usr/bin/perl
#
#
# Program:	weblinklistmaker_2.pl
# Creator:	Eric Hepperle
# Date:	11/26/01
#
# Purpose:	Uses a text list of links to create a template for making subject-classified weblink list.  Output is an html document with table and hyperlinks.  This script also parses the links into site and page as well as determining whether the page is secure or not (https).
#
###################################################
#
# Revisions:
#
#	- Original:  11/26/01
#
#	02/10/02 - Edited for PC use with Win32 systems.
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

#$rowfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/weblink_rowfile.html";
$rowfile = "c:/windows/desktop/weblinklists/weblink_rowfile.html";


print "\n";
print "This program is called weblinklistmaker_2.pl\n\n";

#--------------------------------------------------#
# Here is the breakdown of program operation:
#
# I) Input Interface.
#
#    A) Loop to read list into file
#	or using comma separated variable.
#
####################################################




#$listfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/ehlinklist.txt";
$listfile = "c:/windows/desktop/weblinklists/ehlinklist.txt";

open (FILE, "$listfile");

   # store contents of file in an array.
   @listfiletxt = <FILE>;

close (FILE);


foreach $line (@listfiletxt){

   print "\$line = $line\n";

   ($item, $weburl, $descript) = split(/,/, $line);

   print "$item\n";
   print "$weburl\n";
   print "$descript\n";
   print "\n";

   &maketablerow;

}

#$openfilewez = `/usr/tools/bin/ez $rowfile`;

#$openfilewez &;


#----------
$hold = <STDIN>;

#---------------------------------------------#
# SUBROUTINES:
#---------------------------------------------#


sub maketablerow {

   open (ROWFILE, ">>$rowfile");

      $urllink = $weburl;

      if ($urllink =~/^www./) {

         $urllink = "http://$urllink";

         # Tracing:
         print "\$weburl = $weburl and \n";
         print "\$urllink = $urllink .\n\n"; 

      }
      
      print ROWFILE "<!---- NEW ROW -------------->\n";
      print ROWFILE "<TABLE BORDER = 2>\n";
      print ROWFILE "<TR>\n";
      print ROWFILE "<TD width = 100>$item </TD>\n";
      print ROWFILE "<TD width = 450><a href = \"$urllink\" TARGET = \"TOP\">$weburl</TD>\n";
      print ROWFILE "<TD width = 100> $descript<BR></TD>\n";
      print ROWFILE "</TR>\n";
      print ROWFILE "</TABLE>\n";

   close (ROWFILE);
}
