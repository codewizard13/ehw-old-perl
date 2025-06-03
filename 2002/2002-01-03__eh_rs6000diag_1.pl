#!/usr/bin/perl -w
#
# Program:	eh_rs6000diag_1.pl
# Creator:	Eric Hepperle
# Date:		09/14/01
#
# Purpose:	Eventually, this program will give the option to do just about everyting.  It currently runs a batch process of diagnostic aix commands and then writes the results to an unfiltered report file.  Afs id commands are also executed.  The next step will be to parse the unabridged log file and create a report based on identified flags.
#
#####################################################


# This script utilized a good yes/no challenge routine.

# Planned Improvements:
#
# * Create the following groupings:
#	-WORKSTATION
#	-AFS SPACE
#	-AFS ID
#	-PRINTING
#	-	




#************************************************
# Get User input:
#************************************************
#

print "\n";

print "Enter the customer's employee serial number:	";
$emp_ser = <STDIN>;
chomp $emp_ser;
print "\$emp_ser = $emp_ser\n\n";

print "Enter the customer's RS/6000 workstation name:	";
$ws_name = <STDIN>;
chomp $ws_name;
print "\$ws_name = $ws_name\n\n";

print "What is your primary Rochester AFS/DFS user id?:	";
$afsuid = <STDIN>;
chomp $afsuid;
print "\$afsuid = $afsuid\n\n";

print "Do you have an admin. id for the Rochester AFS cell?: ";
$ans = <STDIN>;
chomp $ans;
print "\n";

if ($ans =~ /^[Yy][Ee][Ss]$/ || $ans =~ /^[Yy]/) {

   print "What is your administrator id?:	";
   $adminid = <STDIN>;
   chomp $adminid;
   print "\n";

   print "what is your admin. passwd?:		";
   system("stty -echo");
   $adm_passwd = <STDIN>;
   system("stty echo");
   chomp $adm_passwd;
   print "\n";

   print "For secure purposes you will be authenticated as:	";
   print $adminid;
   print "\n";

} else {

   print "Be advised: You will be unable to access secure information without an authorized AFS id!\n\n";

}

print "What is the AFS/DFS id in question?:	";
$id2check = <STDIN>;
chomp $id2check;
print "\n";
print "\$id2check = $id2check\n\n";

print "\n";
print "creating report ...\n\n";


#************************************************
# Definitions:
#************************************************
#

$date = `date`;
$date_remote = `rsh $ws_name date`;
$dfk = `rsh $ws_name df -k`;
$errpt = `rsh $ws_name errpt`;
$lspsa = `rsh $ws_name lsps -a`;
$psaux = `rsh $ws_name ps aux`;
$psef = `rsh $ws_name ps -ef`;
$dcehlth = `/etc/dce_health`;
$lsdce = `rsh $ws_name lsdce`;
$lsdfs = `rsh $ws_name lsdfs`;
$cashszq = `rsh $ws_name cachesize query`;
$afsidlst = `grep $emp_ser /etc/passwd`;
$kaseuid = `kas e -name $id2check -admin_username $adminid -password_for_admin $adm_passwd`;
$lscfg = `rsh $ws_name lscfg`;
$lsvgrtvg = `rsh $ws_name lsvg rootvg`;





$reportfile_prime = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/rs6000_report1.tmp";

$condreport_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/rs6000_report_cond.tmp";

$dfk_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/dfkfile.tmp";

$errpt_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/errptfile.tmp";

$lspsa_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/lspsafile.tmp";

$psaux_file = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/psauxfile.tmp";


print "$reportfile_prime\n\n";
print "$condreport_file\n\n";

#************************************************
# FORMAT REPORT & PRINT TO FILE:
#************************************************
#

open (RPRT1, ">$reportfile_prime");

open (CNDRPT, ">$condreport_file");

   

   print RPRT1 "RS\\6000 WORKSTATION DIAGNOSTIC REPORT:\n";
   print RPRT1 "$date\n";
   print RPRT1 "-------------------------------------\n\n";
   

   print RPRT1 "Here is the Filesystem Info: \n";
   print RPRT1 "(command:  df -k)\n";
   print RPRT1 "\n";
   print RPRT1 $dfk;
   print RPRT1 "\n";


      # Are any filesystems full?
      #$fullfilesys = `grep '100%' \@dfk`;
      @dfk = ($dfk);
      #print "These are the full filesystems: \n";
      #print $fullfilesys;
      #print "\n";


      open (DFKFL, ">$dfkfile.tmp") or die "can't open $dfkfile.tmp: $!";

         @dfk = $dfk;

      print grep /0%|7%/i, @dfk;
      print "\n";
      print DFKFL grep /0%|7%/i, @dfk;

      close (DFKFL);



   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is the error report: \n";
   print RPRT1 "(command:  errpt)\n";
   print RPRT1 "\n";
   print RPRT1 $errpt;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is some page space info: \n";
   print RPRT1 "(command:  lsps -a)\n";
   print RPRT1 "\n";
   print RPRT1 $lspsa;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is the CPU and RAM usage: \n";
   print RPRT1 "(command: ps aux)\n";
   print RPRT1 "\n";
   print RPRT1 $psaux;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is some process information: \n";
   print RPRT1 "(command: ps -ef)\n";
   print RPRT1 "\n";
   print RPRT1 $psef;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is some dce config. info: \n";
   print RPRT1 "(command: lsdce)\n";
   print RPRT1 "\n";
   print RPRT1 $lsdce;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is some dfs config. info: \n";
   print RPRT1 "(command: lsdfs)\n\n";
   print RPRT1 $lsdfs;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is the cachesize: \n";
   print RPRT1 "(command: cachesize query)\n\n";
   print RPRT1 $cashszq;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here are your AFS/DFS id's: \n";
   print RPRT1 "(command: grep $emp_ser /etc/passwd)\n\n";
   print RPRT1 $afsidlst;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "The afsid $id2check shows the following status: \n";
   print RPRT1 "(command: kas e $id2check)\n\n";
   print RPRT1 $kaseuid;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "Here is your Workstation's hardware config info: \n";
   print RPRT1 "(command: lscfg)\n\n";
   print RPRT1 $lscfg;
   print RPRT1 "\n";

   print RPRT1 "***----------***----------***\n";
   print RPRT1 "-----------------------------: \n";
   print RPRT1 "(command: lsvg rootvg)\n\n";
   print RPRT1 $lsvgrtvg;
   print RPRT1 "\n";


   print RPRT1 "***----------***----------***\n";


close (CNDRPT);


close (RPRT1);






# open resulting report in a browser:
system ("netscape $reportfile_prime");
