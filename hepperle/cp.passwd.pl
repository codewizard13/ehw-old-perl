#!/usr/bin/perl
#
#
# Program:	cp.passwd.pl
# Creator:	Eric Hepperle
# Date:		01/28/02
#
# Purpose:	Project I am doing for Tom Sheffrey.  In previous versions of this script I rewrote functions within the code from ksh to perl.  In this version, I am starting from scratch and writing the code from a goal-oriented standpoint.  Additionally, this version should take less than 3 minutes becuase I will use regex.
#
###################################################
#
# Revisions:
#
#	- Original:  01/24/02
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


###################################################
# PRINT HEADER:
###################################################
#


# get start time.
&stdtime;

$starttime = $stdtime;
$starthr = $milhour;
$startmin = $min;
$startsec = $sec;

print " -- ($0 began running as process $$ at $stdtime.) --\n\n";


print "\n=============================================================\n";
print "This program is called cp.passwd.pl";
print "\n=============================================================\n\n";



###################################################
# DEFINE FILE VARIABLES:
###################################################
#

$local_passwd = "/etc/passwd.local";
$etc_passwd = "/etc/passwd";
#$global_passwd = "/afs/rchland.ibm.com/common/prod/etc/passwd";
$global_passwd = "/afs/rchland.ibm.com/usr3/v2cib484/passwd_bkp_012402";


# Unless global passwd file is zero length, ...
#
# NOTE:		-s is true if file is not zero length.
#
if (-s $global_passwd) {

   # TRACING:
   print " * The file [$global_passwd] exists and is not zero-length.\n\n";



   ###################################################
   # PARSE LOCAL FILE:
   ###################################################
   #

   # if local passwd file exists, ...
   if (-e $local_passwd) {

      # TRACING:
      print " * The file [$local_passwd] exists and is not zero-length.\n\n";

      # Open local passwd file for reading. [1 array]:
      open (LOCAL, $local_passwd);
         # store contents in an array.
         @localarray = <LOCAL>;
      close (LOCAL);

      # foreach id that exist in local, match that against global:
      foreach $lid (@localarray) {

      open (GLOBAL, $global_passwd);
         $global = <GLOBAL>;

         $global =~ /^$lid:/g;

         if ($global) {

            print "$1 was found in the global file\n";

	 }

      }


   } else {

      print "\t--------------------\n";
      print "\t File: [$local_passwd] is zero length!\n\n";
      print "\t COULD NOT PERFORM OPERATION! : $!\n";
      print "\t--------------------\n";


   }

} else {

   print "\t--------------------\n";
   print "\tFile: [$global_passwd] is zero length!\n\n";
   print "\tCOULD NOT PERFORM OPERATION! : $!\n";
   print "\t--------------------\n";


}

print "\n\n";


# TRACING:
print "--------------------\n";
print "Here are the user ids:\n";
print "--------------------\n\n";

foreach $id (@uidarray) {

   print "UID:\t $id\n\n";

}





###################################################
# COMPARE NAMES AGAINST GLOBAL PASSWD FILE:
###################################################
#

# read each id in the local passwd file.
foreach $uid (@uidarray) {

   # read each id in the global passwd file and ...
   # foreach $guid (@guidarray) {
   # (THIS WORKS, but is slow);
   # using a foreach loop here takes too long; will try a perl grep instead.
   #
   @grepres = (grep /^$uid\b/i, @guidarray);

   if (@grepres) {
   print "THESE ID'S WERE FOUND IN both the the local and global passwd files:\n\n";
   print "@grepres\n\n\n";

   }

#   print "The id [$uid] was found in the Global Passwd file.\n\n";

      # if the id in global passwd file matches an id in the local passwd file ...
#      if ($guid eq $uid) {

#         print "The id [$guid] exists in the Global Passwd file.\n\n";

#      }

#   }

}



sub stdtime {

   &gettime;

   $milhr = $hour;

   if ($hour > 12) {
      $hour = $hour - 12;
      $suffix = "PM";
   } else {
      $hour = $hour;
      $suffix = "AM";
   }

   $miltime = "$milhr:$min:$sec";
   $stdtime = "$hour:$min $suffix";

   print "MILITARY TIME:\t[$miltime].\n\n";
   print "STANDARD TIME:\t[$stdtime].\n\n"; 

   sub gettime {

    ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
     $mon++;
     $date = sprintf("%0.2s/%0.2s/%0.4s", $mon, $mday, $year+1900);
     $time = sprintf("%02.2s:%02.2s:%02.2s", $hour, $min, $sec);

   }


}







# get end time.
&stdtime;

$endtime = $stdtime;
$endhr = $milhour;
$endmin = $min;
$endsec = $sec;

print " -- ($0 finished running at $stdtime.) --\n\n";


sub calctimediff {

   $ttlhr = $endhr - $starthr;
   $ttlmin = $endmin - $startmin;
   $ttlsec = $endsec - $startsec;

   # do final calculation of totals so we have no negatives;

   if ($endsec < $startsec) {
      $ttlsec = $ttlsec + 60;
      $ttlmin--;
   }
   if ($endmin < $startmin) {
      $ttlmin = $ttlmin + 60;
      $ttlhr--;
   }
   

   $timettl = sprintf("%02.2d:%02.2d:%02.2d", $ttlhr, $ttlmin, $ttlsec);


   print "\nTOTAL PROCESS TIME:\t $timettl.\n\n";

}


&calctimediff;


# signal the end of the program.
print "--- END ---\n\n";
 
