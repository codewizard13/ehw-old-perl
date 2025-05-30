#!/usr/bin/perl
#
#
# Program:	phonelist_r4_120601.pl
# Creator:	Eric Hepperle
# Date:		12/06/01
#
# Purpose:	Based on my searchbluepages.pl script.  Prints up a table of user info for most common users calling or being called by the AIX/AFS helpdesk.  Copy to cgi-bin folder.
#
###################################################
#
# Revisions:
#
#	- Original:  12/02/01
#
#	- 12/06/01   Previous version was
#		     "phonelist_r3_120501".
#
#		     This version gets first and
#		     last name from the "callupname"
#		     bluepages identifier.
#
#		     This version also improves on
#		     the last because it searches
#		     searial number and country
#		     code pair.
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
print "\.tiny \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 4pt\; color: aqua\}\n";
print "\.tinyp1 \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: pt5\; color: aqua\}\n";
print "\.tndstamp \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 12pt\; color: lime\}\n";
print "\.regular \{ font-family:  \"Tahoma\",\"Arial\"\; font-size: 9.5pt\; color: black\}\n";

print "-->\n";
print "</STYLE>\n";
print "</HEAD>\n";

print "<BODY BGCOLOR = black text = lime link = aqua vlink = mediumvioletred >\n";

print "<BR>\n\n";
print "<BR>This program is called phonelist_r4_120601.pl<BR><BR>\n";
print "\n";


# Print Table Headings:
#
print "<TABLE BORDER = 5>\n";
      print "<TR>\n";
      print "<FONT COLOR = RED>\n";
      print "<TH WIDTH = 250 VALIGN = TOP ALIGN = CENTER><H3 CLASS = \"time\"><B>Last Name</B></A></H3></TH>\n";
      print "<TH WIDTH = 200 VALIGN = TOP><H3 CLASS = \"time\">First Name</H3></TH>\n";
      print "<TH WIDTH = 200 VALIGN = TOP><H3 CLASS = \"time\">Serial Number</H3></TH>\n";
      print "<TH  WIDTH = 200 VALIGN = TOP><H3 CLASS = \"time\">Phone Num:</H3></TH>\n";
      print "<TH  WIDTH = 200 VALIGN = TOP><H3 CLASS = \"time\">E-mail</H3></TH>\n";
      print "</TR>\n";
      print "</FONT>\n";
      #print "</TABLE>\n";



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

   # !!!!!!!!!!!!!! FIX THIS PROBLEM !!!!!!!!!!!!!!!!!!!
   $sercc = "$serial\897";

   # Tracing:
   print "<BR>\$sercc = $sercc<BR>\n";

   # Do the actual blue pages search and store
   # results in a scalar variable.
   #
   # NOTE:	Ran into a problem here becuase I
   #		was originally using the wrong
   #		syntax of "ibmserialnumber=<serial><cc>"
   #
   #		Other correct ldap search pairs are:
   #
   #		ibmserialnumber=<serial>
   #		uid=<serial><country code>
   #		sn=<lastname>
   #
   #		The lesson learned is make sure your ldap
   #		syntax is correct.
   #
   @userinfoarray = `ldapsearch -h bluepages.ibm.com -b "ou=bluepages,o=ibm.com" uid=$sercc`;

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
      # print "\$identifier: $identifier --  \$value: $value \n";


      #-----------------------------------------
      # Assign the actual values for each table entry:
      #

      # Parse callupname to get first, last, & mid:
      #
      if ($identifier eq "callupname") {

         $fullname = $value;
         chomp $fullname;

         @splitname = split (/,/, $fullname);

         # Define last name:
         $lastname = @splitname[0];

         @firstandmid = split (/\s/, @splitname[1]);

         # Define first name:
         $firstname = @firstandmid[1];

         # Define middle name:
         $middlename = @firstandmid[2];

         print "<BR> \$lastname = $lastname <BR>\n";
         print "<BR> \@firstandmid[1]:@firstandmid[1]  -- \@firstandmid[2]:@firstandmid[2]<BR>\n";

      }


      # Note:	Had originally used "ibmserialnumber"
      #		variable, but it kept giving wrong
      #		info on several records.
      # 
      #		Now using "serialnumber" because it
      #		incorporates the country code as well
      #
      
      if ($identifier eq "serialnumber") {

         $serandcc = $value;
         chomp $serandcc;

         $cc = substr("$serandcc", -3, 3);

         print "<BR>country code: $cc<BR>\n";

         $sernum = $serial;

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

         
      }

      if ($identifier eq "mail") {

         $email = $value;
         chomp $email;

         
      }

      
  # END -- Foreach Line in Ldap Search Loop.
  }
 
      #-----------------------------------------
      # CREATE TABLES:
      #-----------------------------------------
      #
      # Make sure to create the tables AFTER you
      # read all variables, and before you read
      # the next serial.
      #

      # Store the command to open a bluepages search in
      # a scalar variable.
      $bpsrch = "http://bluepages.ibm.com/cgi-bin/bluepages.pl?searchcnum=$serandcc&directory=ALL";

      # Tracing:
#      print "\$bpsrch = $bpsrch<BR>\n";

      #print "<TABLE BORDER = 1>\n";
      print "<TR>\n";
      print "<TD  WIDTH = 250 VALIGN = TOP><H2 CLASS = \"tndstamp\"><A href = \"$bpsrch\" TARGET = \"BOTTOM\"><B>$lastname</B></A></H2></TD>\n";
      print "<TD  WIDTH = 200 VALIGN = TOP><H2 CLASS = \"tndstamp\">$firstname</H2></TD>\n";
      print "<TD  WIDTH = 200 VALIGN = TOP><H5 CLASS = \"timyp1\">$sernum</H5></TD>\n";
      print "<TD  WIDTH = 200 VALIGN = TOP><H5 CLASS = \"tinyp1\">$phone</H5></TD>\n";
      print "<TD  WIDTH = 200 VALIGN = TOP><H7 CLASS = \"tinyp1\"><A href=mailto:$email>$email</A></H7></TD>\n";
      print "</TR>\n";
   #   print "</TABLE>\n";

 

# END -- Foreach Serial Number Loop.
}


print "</TABLE>\n";


# Closing HTML Text
print "</BODY>\n";
print "</HTML>\n";
