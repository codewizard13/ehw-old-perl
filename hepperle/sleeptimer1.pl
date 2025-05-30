#!/usr/bin/perl
#
#
# Program:	sleeptimer1.pl
# Creator:	Eric Hepperle
# Date:	01/09/02
#
# Purpose:	Uses the perl 'sleep' function to make a simple event timer.
#
###################################################
#
# Revisions:
#
#	- Original:  01/09/02
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
print "This program is called sleeptimer1.pl\n\n";

#use Term::ANSIColor;
#          print color("red"), "Stop!\n", color("reset");
#          print color("green"), "Go!\n", color("reset");  

sub gettime {

 ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
  $mon++;
   $date = sprintf("%0.2s/%0.2s/%0.4s", $mon, $mday, $year+1900);
   $time = sprintf("%02.2s:%02.2s:%02.2s", $hour, $min, $sec);

}

&gettime;

#$time = scalar(localtime);
#$time = localtime(time);

$nowtime = $time;
print "THE TIME NOW IS: [$time], which will be the start time.\n\n";


$period_in_hours = 1;

$perinsec = $period_in_hours * 3600;

$finhour = $hour + $period_in_hours;
print "The ENDING HOUR will be: [$finhour].\n\n";

# convert military hours to AM/PM notation.
if ($finhour > 12) {
   $finhrstd = $finhour - 12;
   $suffix = "PM";
} else {
   $finhrstd = $finhour;
   $suffix = "AM";
}

$standardtime = "$finhrstd:$min $suffix  and $sec seconds";
print "STANDARD TIME END: [$standardtime].\n\n";

$endtime = sprintf("%02.2s:%02.2s:%02.2s", $finhour, $min, $sec);
print "The END TIME will be: [$endtime].\n\n";

# Determine how many times per hour to run prog.
# Here are some useful equivalents:
#
# every 2 minutes = 30
# every 5 minutes = 12
# every 10 minutes = 6
# every half hour = 2
# every hour = 1
#
$freq_perhr = 30;

# define how many seconds to wait before running main prog.
$pausetime = 3600 / $freq_perhr;
print "The NUMBER OF SECONDS to sleep is: [$pausetime].\n\n";



#########################################
# RUN MAIN PROG:
#########################################
#


# define default test url.
$urldefault = "http://www.winsite.com";

print "\n\n";
print "#######################################################\n\n";


print "HERE IS THE FIRST INSTANCE ...\n\n";
#system("netscape $urldefault");

until ($time eq $endtime) {

   &gettime;
 
   print "The CURRENT TIME is: [$time].\n\n";
#   system("netscape $urldefault");




   if ($time eq $endtime) {

      print "

      The END TIME has been reached.

      Projected endtime was [$endtime]; actual endtime is [$time].\n\n";
      print "Thank You for using this program, $0\n\n";

     exit;

   }

     sleep($pausetime);

}
      





