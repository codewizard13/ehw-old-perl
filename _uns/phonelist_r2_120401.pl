#!/usr/bin/perl
#
#
# Program:	phonelist_r2_120401.pl
# Creator:	Eric Hepperle
# Date:		12/04/01
#
# Purpose:	Based on my searchbluepages.pl script.  Prints up a table of user info for most common users calling or being called by the AIX/AFS helpdesk.  Copy to cgi-bin folder.
#
###################################################
#
# Revisions:
#
#	- Original:  12/02/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


#-----------------------------------------
# HTML/CGI CODE (head,style,body):
#-----------------------------------------

# Mandatory CGI Header
print "Content-type: text/html", "\n\n";

print "<HTML>\n";

print "<HEAD>\n";
print "<STYLE TYPE=\"text/css\">\n";
print "<!--\n";

print "\.time \{font-family:  \"Gill Sans\", \"Tahoma\", \"Arial\"\; font-size: 10pt\; color: red\}\n";
print "\.tiny \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 4pt\; color: lightslateblue\}\n";
print "\.tinyp1 \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 5pt\; color: lightslateblue\}\n";
print "\.tndstamp \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 10pt\; color: lightslateblue\}\n";
print "\.regular \{ font-family:  \"Tahoma\",\"Arial\"\; font-size: 9.5pt\; color: black\}\n";

print "-->\n";
print "</STYLE>\n";
print "</HEAD>\n";

print "<BODY BGCOLOR = black text = lime alink = blue vlink = violet >\n";

print "<BR>\n\n";
print "<BR>This program is called phonelist_r2_120401.pl<BR><BR>\n";
print "\n";


#-----------------------------------------
# FILE VARIABLE DEFINITIONS:
#-----------------------------------------

$varlist = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/bluepages.envvarlist.ez";
$sernum_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/sernum_file.ez";


# Open serial number file and assign contents to an array.
open (SERNUMFILE, "$sernum_file");
   @sernumfile = <SERNUMFILE>;
close (SERNUMFILE);


#-----------------------------------------
# GET USER INFO AND PROCESS IT:
#-----------------------------------------

# For each serial number ...
foreach $serial (@sernumfile){

   # remove new line character.
   chomp $serial;

   # Do the actual blue pages search and store
   # results in a scalar variable.
   #
   @userinfoarray = `ldapsearch -h bluepages.ibm.com -b "ou=bluepages,o=ibm.com" ibmserialnumber=$serial`;

   # Assign unique employee info file for each serial:
   $empinfo = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/bluepgsrecords/bluepages.$serial";

   # write ldap search results to a file.
   open (EMPINFO, ">$empinfo");

      print EMPINFO @userinfoarray;

   close (EMPINFO);


   # For each line in the ldap search...
   #
   foreach $line (@userinfoarray){

      # remove new line character.
      chomp $line;

      # Split each line at an "=" sign.
      @linearray = split(/=/, $line); 

      # Assign descriptive variables to array elements ...
      $identifier = @linearray[0];
      $value = @linearray[1];

      # Verify the contents of $identifier and $value for each
      # identifier/value pair:
      #
    print "\$identifier: $identifier --  \$value: $value \n";


      #-----------------------------------------
      # Assign the actual values for each table entry:
      #

      # Initialize the $toprint variable.
      $toprint = "n";


      # If flage each true value with $toprint = yes:
      if ($identifier eq "sn") {

         $lastname = $value;
         chomp $lastname;

         $toprint = "y";

      }

      if ($identifier eq "givenname") {

         $firstname = $value;
         chomp $firstname;

         # Tracing:
	 print "$firstname\n\n";

         $toprint = "y";

      }

      if ($identifier eq "ibmserialnumber") {

         $sernum = $value;
         chomp $sernum;

         $toprint = "y";

      }

      # If phone number is local, print only an extension,
      # but, if the number is not local, print the whole
      # 8 digits (including "-"):
      #
      if ($identifier eq "tieline") {

         chomp $value;

         $ext = substr("$value", -6, 6);

         $prefix = substr("$value", 0, 3);

         # if the first 3 numbers are 553, then
         # phone is a rochester number:
         # 
         if ($prefix eq "553"){

            $phone = $ext;

	 } else {

         $phone = $value;

	 }             

         $toprint = "y";

      }

      if ($identifier eq "mail") {

         $email = $value;
         chomp $email;

         $toprint = "y";

      }

 
      #-----------------------------------------
      # CREATE TABLES:
      #-----------------------------------------

      # If $toprint = "y", then make a table:
      if ($toprint = "y") {
      
      print "<TABLE BORDER = 2>\n";
      print "<TR>\n";
      print "<TD WIDTH = 200 VALIGN = TOP><H6 CLASS = \"tndstamp\"><B>$lastname</B></TD>\n";
      print "<TD WIDTH = 200 VALIGN = TOP>$firstname</TD>\n";
      print "<TD WIDTH = 200 VALIGN = TOP>$sernum</TD>\n";
      print "<TD WIDTH = 200 VALIGN = TOP>$phone</TD>\n";
      print "<TD WIDTH = 200 VALIGN = TOP>$email</TD>\n";
      print "</TR>\n";
      print "</TABLE>\n";

      }


   # END -- Foreach Line in Ldap Search Loop.
   }

# END -- Foreach Serial Number Loop.
}



# Closing HTML Text
print "</BODY>\n";
print "</HTML>\n";
