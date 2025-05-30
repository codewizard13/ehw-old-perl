#!/usr/bin/perl
#
#
# Program:	setafsquota.pl
# Creator:	Eric Hepperle
# Date:		01/14/02
#
# Purpose:	CGI module for setting AFS quota. 
#
###################################################
#
# Revisions:
#
#	- Original:  01/14/02
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


print "\n\n";
print "This program is called setafsquota.pl\n\n";


#&ReadParse;


print "<title>SET AFS QUOTA Confirmation:</title><h1>CONFIRMATION</h1><hr>";


print "<BR>\n\n";

# Prints the form data which was stored in the hash "%in".
#
#foreach $key (keys %in) {
#   print "<BR><li>$key: $in{$key}";
#   print "<BR>\$in{$key} =\t $in{$key}<BR><BR>\n\n";
#   print "key{$count} = $in{$key}<BR>\n\n";
#}


print "\n\n";

print "<FONT COLOR = GREEN


#print"<BR><B>\$in{volpath}:</B>\t$in{volpath}<BR><BR>\n\n";

#&checkforauth;
&bumpquota;

             
sub bumpquota {

   # assign bumpquota command:
   $bq = `fs sq $volume_path $desired_q`;

   $bq;


}
