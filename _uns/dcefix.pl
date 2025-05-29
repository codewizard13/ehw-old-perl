#!/usr/bin/perl
#
#
# Program:	dcefix.eh.pl
# Creator:	Eric Hepperle
# Date:	11/19/01
#
# Purpose:	Runs the dce repair procedure from helpful.d as an automated script.
#		
#		DOES NOT WORK !!!
#
###################################################
#
# Revisions:
#
#	- Original:  11/19/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

use Cwd;

$dir = cwd;

$cd = "/bin/cd";
$pwd = "/bin/pwd";

print $dir;
print "\n";

$homepath =  "/afs/rchland.ibm.com/usr3/v2cib484";
$dcebkp_file = "/etc/dce/eh.dce.cf.db.bkp";

print "\n";
print "This program is called dcefix.eh.pl";
print "You must use an admin id to run this script (sudo will not work).\n\n";

print "Enter your admin id: ";
$adminid = <STDIN>;
chomp $adminid;

print "Enter the host: ";
$aixhost = <STDIN>;
chomp $aixhost;

print "1) cd to /etc/dce.\n\n";

print "rsh $aixhost cd /etc ...\n\n";

open (FILE, "$dcebkp_file");

   $line = <FILE>;

   print "\$line = \n";
   print "$line";

close (FILE);

$cdetc = `rsh $aixhost 'cd /etc; echo "host: "; hostname; echo "pwd = "; pwd; echo ""; cd dce; echo "pwd ="; pwd; echo ""`;
print $cdetc;


$com2co = `substr($line, 0) =~ s/.com/.co/g`;

print "\$com2co = \n";
print "$com2co\n";


print "\n";
print "2) Edit the dce_cf.db file and change the host principal name,\n";
print "(ie remove the last \"m\" from the hostname.rchland.ibm.com entry).\n";
print "Save the file.\n\n";
print "3) Run   /etc/dfs.clean\n\n";
print "4) Run   /etc/dce.clean\n\n";
print "5) Run    startdfs\n\n";
print "\n";
