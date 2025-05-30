#!/usr/bin/perl
#
#
# Program:	fslqtest.pl
# Creator:	Eric Hepperle
# Date:	01/14/02
#
# Purpose:	Used as a form handler cgi script.  Retrieves and prints to screen user's afs quota.
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


$volume_path = "/afs/rchland.ibm.com/usr3/v2cib484";
   

&getcurrentquota;
 

sub getcurrentquota {

   @gq = `fs listquota $volume_path`;
   print "@gq<br>\n";

   print "CURRENT AFS QUOTA: @gq \n\n";







}
