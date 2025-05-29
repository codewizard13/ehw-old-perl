#!/usr/bin/perl
#
#
# Program:	loghrs.pl
# Creator:	Eric Hepperle
# Date:		01/17/02
#
# Purpose:	This program allows the user to keep track of his or her own hours.  It uses the serial number of the user to make the log.
#
###################################################
#
# Revisions:
#
#	- Original:  01/17/02
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
print "This program is called loghrs.pl\n\n";


####################################################
# GET USER AND TIME INFO AUTOMATICALLY:
####################################################
#

&stdtime;
&getweekday;
&getuserinfo;
&getmonth;

print "\n\n";

# assign variable to hold today's date.
$datetoday = $mmddyy;

# Tracing:
print "TODAY's DATE is:\t $datetoday\n";
print "THE WEEKDAY is:\t\t $wkday\n";
print "THE YEAR IS:\t\t $year4dg\n";
print "THE MONTH IS:\t\t $thismonth\n";
print "THE CURRENT TIME IS:\t $stdtime\n";
print "YOUR SERIAL NUMBER:\t $serial\n";

print "\n";


#-------------------------------------------------------/



#############################################################
# 
#############################################################

# define main directory.
$maindir = $homedir;

# take the full name and convert to all lowercase w/ no spaces.
$longname = "\L$firstname$lastname";

# Tracing:
print "LONGNAME =\t\t $longname\n\n";

# define tmp dir.
$tmpdir = "$maindir/tmp";

# define user temp dir.
$usertmpdir = "$tmpdir/$longname\_hrs.tmp.dir";

# if tmp dir doesn't exist in user's root, then create one.
unless (-e $tmpdir) {
   mkdir($tmpdir,755) || die "cannot create dir $tmpdir : $!";
} else {
   print "The directory $tmpdir already exists\n";
}


# if user temp dir doesn't exist, create it.
unless (-e $usertmpdir) {
   mkdir($usertmpdir,755) || die "cannot create dir $usertmpdir : $!";
} else {
   print "The directory $usertmpdir already exists\n";
}


# define output log file.
$outlog = "$usertmpdir/loghrs_out_plain.ez";


# open output file for writing.








print "\n --- END ---\n\n";




###############################################################
# SUBROUTINES:
###############################################################
#


sub gettimendate {

  ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
   $mon++;
   $date4dgyr = sprintf("%0.2s/%0.2s/%0.4s", $mon, $mday, $year+1900);
   $time = sprintf("%02.2s:%02.2s:%02.2s", $hour, $min, $sec);
   $year4dg = sprintf("%0.4s", $year+1900);
   $mmddyy = sprintf("%02s/%02s/%02s", $mon, $mday, $year%100);

}


sub stdtime {

   &gettimendate;

   $milhr = $hour;

   if ($hour > 12) {
      $hour = $hour - 12;
      $suffix = "PM";
   } else {
      $hour = $hour;
      $suffix = "AM";
   }

   # if I find that 3:30 prints as 3:3, I will use this syntax:
   $min2dg = sprintf("%02d", $min);

   # Tracing:
   # print "\$min2dg =\t\t $min2dg\n";

   $miltime = "$milhr:$min2dg:$sec";
   $stdtime = "$hour:$min2dg $suffix";

   # print "MILITARY TIME:\t[$miltime].\n\n";
   # print "STANDARD TIME:\t[$stdtime].\n\n"; 
 
}


sub getweekday {

   %dayofweek;

   $dayofweek{1} = "Monday";
   $dayofweek{2} = "Tuesday";
   $dayofweek{3} = "Wednesday";
   $dayofweek{4} = "Thursday";
   $dayofweek{5} = "Friday";
   $dayofweek{6} = "Saturday";
   $dayofweek{7} = "Sunday";

   print "THE DAY OF THE WEEK IS:  $dayofweek{$wday}\n";

   # assign hash var to scalar var.
   $wkday = $dayofweek{$wday};

}


sub getmonth {

   %monthnum;

      $monthnum{1} = "January";
      $monthnum{2} = "February";
      $monthnum{3} = "March";
      $monthnum{4} = "April";
      $monthnum{5} = "May";
      $monthnum{6} = "June";
      $monthnum{7} = "July";
      $monthnum{8} = "August";
      $monthnum{9} = "September";
      $monthnum{10} = "October";
      $monthnum{11} = "November";
      $monthnum{12} = "December";

      $thismonth = $monthnum{$mon};
   
}

sub getuserinfo {

   # This returns a number which is the actual userid of the user.
   # This number doesn't mean anything to us, but we can use it
   # as a key to find the user's info in the passwd file.
   # The passwd file records this info in the 3rd field.
   #
   $useridnum = $>;

   # get user id and serial.
   $greppasswd = `grep $> /etc/passwd`;
   #
   # remove new line char from end of string.
   chomp $greppasswd;

   # PARSE greppasswd:
   #
   # split the result of the grep at colons.
   @spgrep = split(/:/, $greppasswd);

   $userid = @spgrep[0];
   $isvend = @spgrep[1];
   $fullname = (split(/,/, @spgrep[4]))[0];



   # Tracing:
   print "\$fullname = $fullname\n";

   # parse first and last name from fullname var.
   @spname = split(/ /, $fullname);   
   
   $firstname = $spname[0];
   $lastname = $spname[1];
   $serial = (split(/,/, @spgrep[4]))[1];
   $homedir = @spgrep[5];
   $dshell = @spgrep[6];


   # Tracing:
   $count = 0;
   print "TRACING:\n";
   print "=================================\n";
   foreach $el (@spgrep) {
      print "\@spgrep[$count] =\t @spgrep[$count]\n";
      $count++;
   }
   print "\n\n";
   

   # Tracing:
   print "FULL NAME:\t $fullname\n\n";
   print "SERIAL:\t $serial\n\n";
   print "FIRST NAME:\t $firstname\n";
   print "LAST NAME:\t $lastname\n";
   print "\n";

   # Tracing:
   print "RESULT OF PASSWD FILE GREP:\n";
   print "$greppasswd\n";

}
