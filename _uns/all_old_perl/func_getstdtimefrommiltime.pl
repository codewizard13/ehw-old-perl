#!/usr/bin/perl
#
#
# Program:	func_getstdtimefrommiltime.pl
# Creator:	Eric Hepperle
# Date:	01/10/02
#
# Purpose:	Function for converting military time to standard time.  Arguments are $hour.
#
###################################################
#
# Revisions:
#
#	- Original:  01/10/02
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called func_getstdtimefrommiltime.pl\n\n";

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



stdtime();
