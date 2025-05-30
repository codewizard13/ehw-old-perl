#!/usr/bin/perl
# File eh_multiwsinst_perl.pl created by Eric Hepperle at 08:35:31 on Fri Jun 29 2001. 
#
# Program:	eh_multiwsinst_perl.pl
# Creator:	Eric Hepperle
# Date:		06/29/01
#
# Purpose:	Creates a config file and then runs the command
#		to build wsinstall image from a the input
#		parameters given by user.
# 
###################################################



print "\n";
print "File:  $0 \n";
print "========================================\n";
print "\n";

print "Enter the name of machine to define:  ";
$machname = <STDIN>;
chomp $machname;
print "\n";

# Fixed var:
$cpu = "0";

print "Enter the display type (lft0, tty0): ";
$disp = <STDIN>;
chomp $disp;
print "\n";

print "Enter the machine type (rs6k, rspc, rs6ksmp, rspcsmp, chrp, chrpsmp or h for help): ";
$machtype = <STDIN>;
chomp $machtype;
print "\n";

print "Enter the AIX version (std.4.3.3.4, afs.4.3.3.4, etc ...): ";
$aixver = <STDIN>;
chomp $aixver;
print "\n";


#----------------------------------------
hdisk_size_array:
#----------

# Create Hdisk array:
#

$count = 1;

if($hdnum ne "") {


   foreach $element (@hdnameary) {

      print "element #$count = $element \n";


   }







   $hdnameary[$count - 1] = $hdname;

   

   print "$hdname = $hdname\n";
   print "\n";

   $count++;

   $hdnum--;


}

# Tracing:
print "The hdname array is:  @hdnameary \n";

$hdnameary = join(":", @hdnameary);

print "The new hdnameary is: $hdnameary\n";
print "\n";





# Define configuration string.
  $cfgstr = "$machname $cpu $disp $machtype $aixver $hdnameary $hdszary $adapter $full_ip $gtwyprime $sbnmask $ringspd $cbltype $lvnmary $lvszary";

print "\$cfgstr = $cfgstr\n";
print "\n";



# The command to run ws install from a file is:
# /usr/lpp/wsinstall/bin/wsinstall -alf <filename>
#

# Format to make config file:
#goldcad8.rchland.ibm.com 0 lft0 rs6k afs.4.3.3.4 hdisk0 2000 tr0 9.5.34.33 9.5.34.1 255.255.255.0 16 N/A hd6:hd9var:hd3:hd1:lv00:lv01:lv02 512:88:112:16:512:48:16 
#goldcad10.rchland.ibm.com 0 lft0 rs6k afs.4.3.3.4 hdisk0 2000 tr0 9.5.34.39 9.5.34.1 255.255.255.0 16 N/A hd6:hd9var:hd3:hd1:lv00:lv01:lv02 512:88:112:16:512:48:16 
