#!/usr/bin/perl
# File wsinst_multi.pl created by Eric Hepperle at 13:21:12 on Tue Sep 18 2001. 
#
# Program:	wsinst_multi.pl
# Creator:	Eric Hepperle
# Date:		09/18/2001
#
# Purpose:	To automatically create a config file for
#		doing multiple image creates for workstations
#		with similar configurations.
#
#		I wrote a cshell script that does this
#		called "wsinst_multi.makecfg.csh", and
#		I think the perl code should be
#		easier to write.
#
###################################################
#
# Revisions:
#	Original	- 09/18/01
#
#
###################################################
#
# Related and Dependent files:
#
# - wsinst_multi_wfulltracing.pl
#	based on this script but it has tracing mechanisms.
#	Creation date: 11/14/01
#
###################################################


#############################################
# GET INPUT FROM USER:
#############################################
#

print "\n\n";

print "Enter hostname: ";
$hostname = <STDIN>;
chomp $hostname;

$hostip_ux = `host $hostname`;

@hostip_ary = split(/ /, $hostip_ux);

# Tracing:
print "\@hostip_ary = @hostip_ary\n\n";

# assign the three parts of host command result:
($hostfull, $is, $hostip) = @hostip_ary;
chomp $hostip;


print "\$hostfull = $hostfull\n\n";

($hostname,$a,$b,$c) = split(/\./,$hostfull);
# courtesy of Gary Reed.

print "\$hostname = $hostname\n\n";

print "\$hostip = $hostip\n\n";

#get only the first 3 octets:
($oct1,$oct2,$oct3,$junk) = split (/\./, $hostip);

# Tracing:
#$3octsofip = "$oct1.\."."$oct2."."$oct3";
$threeoctsofip = "$oct1\.$oct2\.$oct3";

print $oct1.$oct2.$oct3 , "\n\n";

print "\$threeoctsofip = $threeoctsofip\n\n";

print "\n";

print "Enter lft0 for graphics display, or tty0 for ASCII terminal: ";
$disp = <STDIN>;
chomp $disp;

print "Enter machine type (rs6k, rspc, chrp, etc ...): ";
$machtype = <STDIN>;
chomp $machtype;

print "Enter the LAN connection type (tr0 for token-ring, en0 for ethernet): ";
$cnnct = <STDIN>;
chomp $cnnct;

print "Enter \'afs\' for a client machine, or \'std\' for a standalone: ";
$client = <STDIN>;
chomp $client;

print "Enter build number (4.3.3.4, 4.3.1.2, etc...): ";
$bdnum = <STDIN>;
chomp $bdnum;
print "\n";

$build = "$client.$bdnum";

print "The build you chose is: $build\n\n";

print "Enter the number of hard disks: \n ";
$hdnum = <STDIN>;
chomp $hdnum;

print "Enter the respective sizes of the hd's: \n\n";

$count = 0;

for $count (1..$hdnum){

   $countp = $count - 1;
   print "Enter the size of hdisk$countp: ";
   $hdsize = <STDIN>;
   chomp $hdsize;
   $hdsize[$countp] = $hdsize;

   print "The size of hdsize$count = $hdsize\n\n";

}

print "Just to recap, the hdsizes are as follows:\n\n";

for $count2 (1 .. $hdnum) {

   $counts = $count2 - 1;
   print "hdisk$counts = $hdsize[$counts] MB\n";

   $hdname = "hdisk$counts";

   @hdnameary = (@hdnameary, $hdname);

   @hdszary = (@hdszary, $hdsize[$counts]);

}

print "\n";

$hold = <STDIN>;

# create hdisk array:

print "\@hdnameary = @hdnameary\n\n";

print "\@hdszary = @hdszary\n\n";

print "\n";

$hdnms = join (":", @hdnameary);

print "The joined hdisk name array is: $hdnms\n\n";

$hdszs = join (":", @hdszary);

print "The joined hdisk size array is: $hdszs\n\n";


&getnetcfginfo;


# Define standard file system array names and sizes:
#
$filesysarray = "hd9var:hd3:hd1:lv00:lv01:lv02";

$filesyssizes = "64:128:16:256:48:16";


&setoutputstring;

print "Press any key to continue ... and create an image";
$hold = <STDIN>;

&createimage;



#--------------------------------


sub getnetcfginfo {

   # We are interested in the /etc/network.config file here.
   #

   print "Retrieving TCP/IP info ...\n\n";

   $netcfginfo = `grep $threeoctsofip /etc/network.config`;

   print "\$netcfginfo = $netcfginfo\n\n";

   ($junk, $junk, $ringspdwm, $subnet_mask, $gateway1, $gateway2, $bldg) = split (/\s+/, $netcfginfo);

   print "Here is retrieved info ...\n\n";

   $ringspd = substr("$ringspdwm", 0, 2);

   print "Ringspeed = $ringspd\n";
   print "Subnet Mask = $subnet_mask\n";
   print "Primary Gateway = $gateway1\n\n";



}


sub setoutputstring {

   # fullhostname 0 scrntype machtype img hdnameary hdszary connection hostip gateway1 subnetmask ringspd N/A filesysary filesyssizes

   $outstring = "$hostfull 0 $disp $machtype $build $hdnms $hdszs $cnnct $hostip $gateway1 $subnet_mask $ringspd N/A $filesysarray $filesyssizes\n";

   print $outstring, "\n\n";		# print output to screen.


   # define output file:
   $outputfile = "/afs/rchland.ibm.com/usr3/v2cib484/wsinstmulti.test1.ez";

   open (OUTFILE, ">>$outputfile");

      print OUTFILE $outstring;

   close (OUTFILE);

   print "Press Enter key to open the outputfile for viewing ...";
   $hold = <STDIN>;


   `/usr/tools/bin/ez $outputfile &`;

   print "\n";


}


sub createimage {

   print "Enter the install server name (leave blank to let the program choose): \n";
   $installserver = <STDIN>;
   chomp $installserver;

   `/usr/lpp/wsinstall/bin/wsinstall -alf $outputfile $installserver`;

   

}
