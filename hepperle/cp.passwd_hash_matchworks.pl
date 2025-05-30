#!/usr/bin/perl
#
#
# Program:	cp.passwd_hash_matchworks.pl
# Creator:	Eric Hepperle
# Date:		01/31/02
#
# Purpose:	Project I am doing for Tom Sheffrey.  In previous versions of this script I rewrote functions within the code from ksh to perl.  In this version, I am starting from scratch and writing the code from a goal-oriented standpoint.  Additionally, this version should take less than 3 minutes becuase I will use hashes, per Rich Wales.
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

#------------------------------
# Get START TIME:.
#------------------------------
#
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



###################################################
# DETERMINE IF PASSWD FILE IS EMPTY:
###################################################
#

# If global passwd file is not zero length (empty), ...
#
if (-s $global_passwd) {

   # TRACING:
   print " * The file [$global_passwd] exists and is not zero-length.\n\n";



   # If local passwd file is not zero length (empty), ...
   if (-s $local_passwd) {

      #####################################################
      #####################################################
      # NOTE: This is where all the main processing goes: #
      #####################################################
      #							  #

      # Open local file for reading.
      open (LOCAL, $local_passwd);

         # assign contents of local to an array.
         @localarray = <LOCAL>;

         # read each line in the local file.
         foreach $line (@localarray) {

            # parse the userid portion of each line.
	     $uid = (split (/:/, $line))[0];
            #
            # TRACING:
#            print "\$uid =\t $uid\n\n";

            # store this uid in hash variable:
            $local{$uid} = $line;

         }

      # close local file.
      close (LOCAL);


# print the user ids matched to screen:
# TRACING:
print "--------------------\n";
print "Here are the user ids:\n";
print "--------------------\n\n";


      # Open global file for reading.
      open (GLOBAL, $global_passwd);

         # assign contents of global to an array.
         @globalarray = <GLOBAL>;

         # read each line in the local file.
         foreach $line (@globalarray) {

            # parse the userid portion of each line.
            $guid = (split (/:/, $line))[0];
            #
            # TRACING:
#            print "\$guid =\t $guid\n\n";

            # If guid is the same as uid, ...
            if ($local{$guid}) {

               # print the local uid hash value.
               print "The id [$guid] exists in both files.\n\n";

            # otherwise print the line value.
            } else {

#               print "\$line =\t $line\n\n";

            }
         


	 }




      #                                                   #
      #####################################################
      # END MAIN                                          #
      #####################################################


   } else {

      print "\t--------------------\n";
      print "\t File: [$local_passwd] is zero length!\n\n";
      print "\t COULD NOT PERFORM OPERATION! : $!\n";
      print "\t--------------------\n";

   }



# Otherwise, let user know the file does not exist, and then exit.
} else {

   print "\t--------------------\n";
   print "\tFile: [$global_passwd] is zero length!\n\n";
   print "\tCOULD NOT PERFORM OPERATION! : $!\n";
   print "\t--------------------\n";
   exit;


}

print "\n\n";




#------------------------------
# Get END TIME:.
#------------------------------
#
&stdtime;

$endtime = $stdtime;
$endhr = $milhour;
$endmin = $min;
$endsec = $sec;

print " -- ($0 finished running at $stdtime.) --\n\n";


&calctimediff;


# signal the end of the program.
print "--- END ---\n\n";
 


###################################################
# SUBROUTINES:
###################################################
#


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

