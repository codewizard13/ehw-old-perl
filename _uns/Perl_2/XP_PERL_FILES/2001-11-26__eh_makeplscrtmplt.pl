#!/usr/bin/perl
# File eh_makeplscrtmplt.pl created by Eric Hepperle at 14:39:52 on Wed Oct 24 2001. 
#
# Program:	eh_makeplscrtmplt.pl
# Creator:	Eric Hepperle
# Date:		10/24/01
#
# Purpose:	Makes a new file w/ a user-specified name and based on a standard template designed by me (Eric Hepperle).
#
#
###########################################################

$maindir = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir";

print "\nThank you for using this template:\n\n";

print "Program: ";
$program = <STDIN>;
chomp $program;
print "\n";

print "Creator: ";
$creator = <STDIN>;
chomp $creator;
print "\n";

print "Date: ";
$tday = <STDIN>;
chomp $tday;
print "\n";

print "Purpose: ";
@purpose = <STDIN>;
chomp (@purpose);
print "\n\n";

print "creating file $maindir/$program ...\n\n\n";

&formatnewfile;

print "file successfully created!\n";

# open file w/ ez.
print "Press any key to open the file in ez: ";
$hold = <STDIN>;

$openfilewez = `/usr/tools/bin/ez $maindir/$program &`;

$openfilewez;

$chmodx = `/bin/chmod +x $program`;

$chmodx;


sub formatnewfile {

   $newfile = "$maindir/$program";

   open (NEWFILE, ">$newfile");

   print NEWFILE "#!/usr/bin/perl\n";
   print NEWFILE "#\n";
   print NEWFILE "#\n";
   print NEWFILE "# Program:	$program\n";
   print NEWFILE "# Creator:	$creator\n";
   print NEWFILE "# Date:	$tday\n"; #this does not line up; how to fix?
   print NEWFILE "#\n";
   print NEWFILE "# Purpose:	@purpose\n";
   print NEWFILE "#\n";
   print NEWFILE "###################################################\n";
   print NEWFILE "#\n";
   print NEWFILE "# Revisions:\n";
   print NEWFILE "#\n";
   print NEWFILE "#	- Original:  $tday\n";
   print NEWFILE "#\n";
   print NEWFILE "#\n";
   print NEWFILE "#\n";
   print NEWFILE "###################################################\n";
   print NEWFILE "#\n";
   print NEWFILE "# Planned Improvements:\n";
   print NEWFILE "#\n";
   print NEWFILE "###################################################\n";
   print NEWFILE "#\n";
   print NEWFILE "\n";
   print NEWFILE "print \"This program is called $program\n\"\;\n";

   close (NEWFILE);
   
}
