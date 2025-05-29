#!/usr/bin/perl
#
#
# Program:	checkcoreanderrpt.pl
# Creator:	Eric Hepperle
# Date:		11/27/01
#
# Purpose:	Checks core file and error report and outputs an html page detailing the findings.
#
###################################################
#
# Revisions:
#
#	- Original:  11/27/01
#	- Learned that with split you must use "\s+".
#
#		IT WORKS!
#
#	- 11/28/01  The if statements were not working
#		    correctly.  Discovered that was
#		    because I was using "=" instead
#		    of "eq".  remember that!
#
###################################################
#
# Planned Improvements:
#
###################################################
#

use Cwd;

$dir = cwd;

$rptfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/chkcorerpt.txt";
$rpthtml = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/chkcorerpt.html";

$scalartime = localtime(time);

@scalartimearray = split (/\s+/, $scalartime);
($dayofwk, $curmo, $curday, $begintime, $curyear) = @scalartimearray;

# Tracing:
print "The current year is: $curyear\n";

print "\n";
print "current working directory is:\n";
print "$dir\n\n";

print "\n";
print "This program is called checkcoreanderrpt.pl";
print "\n";

print "Enter the workstation name: ";
$wsname = <STDIN>;
chomp $wsname;

print "Enter the customer's afsid: ";
$afsid = <STDIN>;
chomp $afsid;

print "Enter the customer's wincenter id: ";
$wtsid = <STDIN>;
chomp $wtsid;

@check4core = `/usr/local/bin/ls -lat ~$afsid | grep core`;

$coreresult = "* No core file was found.";

if (@check4core ne "") {

   $homedir = `cd ~$afsid; pwd`;

   print "\$homedir = $homedir\n";

   print "\n";

   foreach $coreline (@check4core) {

      # Tracing
      #print "\$coreline =\n";
      print "$coreline\n\n";

      @spcoreline = split (/\s+/, $coreline);
      ($perm, $num, $owner, $kbytes, $mo, $day, $miltime, $file) = @spcoreline;

      &gettimestamp;

      if ($file eq "core") {

         $result = "Core file found in:	$homedir";

         $coreresult = $result;

         print $result;

      } else {

         $result = "* No core file was found";

         print $result;

      }



   }


}

print "\n";


$srcherrpt = `rsh $wsname errpt | grep wfica`;

if ($srcherrpt eq "") {

   $wficaexists = "* The string wfica was NOT found in the error log.\n";

} else {

   $wficaexists = "The string wfica WAS found in the error log\n for $wsname";

}

&writereport2file;


#------------------------------------------#
# SUBROUTINES:
#------------------------------------------#


sub gettimestamp {

   if ($miltime =~ /:/) {

      #print "$miltime is a time of day\n";

      $yearoffile = $curyear;

   } else {

      #print "$miltime is a year\n";

      $yearoffile = $miltime;

   }


   $timestamp = "$mo $day $yearoffile";

   print "Timestamp:  $timestamp\n";

   if ($file eq "core") {

      $coretime = $timestamp;

   }


}


sub writereport2file {

   open (RPTFILE, ">>$rptfile");

      print RPTFILE "\n";
      print RPTFILE "######################################################\n";
      print RPTFILE "This report was generated on:	$scalartime\n";
      print RPTFILE "\n";
      print RPTFILE "Wincenter ID:		$wtsid\n";
      print RPTFILE "AFS ID:			$afsid\n";
      print RPTFILE "Workstation Name:	$wsname\n";
      print RPTFILE "--------------------------------------------\n";
      print RPTFILE "\n";
      print RPTFILE "$coreresult\n";
      print RPTFILE "Timestamp:		$coretime\n";
      print RPTFILE "\n";
      print RPTFILE "$wficaexists\n";
      print RPTFILE "\n\n";

   close (RPTFILE);

$openrpt = `netscape -install $rptfile &`;

$openrpt;


}
