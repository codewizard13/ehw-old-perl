#!/usr/bin/perl
# File eh_rdlnsfrmlsfl.pl created by Eric Hepperle at 14:41:47 on Tue Sep 25 2001. 
#
# Program:	eh_rdlnsfrmlsfl.pl
# Creator:	Eric Hepperle
# Date:		09/25/01
#
# Purpose:	This program will allow me to figure out how to format output of standard shell commands and parse and manipulate so that I can rearrange the data any way I need to.
#
#
#
###################################################
#
#
#

print "\n";

print "This program will run the ls -lt command and\n";
print "assign each line as an array\n\n";
print "Press enter to begin: ";
$hold = <STDIN>;
$tmpfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/eh_rdlnsfrmlsfl.tmp";


##################################################
# INITIALIZE VARIABLES:
##################################################
#

$count = 0;
@lslt = `ls -lt`;

# run the list command:
print $lslt;

$hold = <STDIN>;


# create a file to hold result of ls -lt command:
#open(OUT, ">$tmpfile");
#   print OUT $lslt;
#close (OUT);

# make a string into an array:
#@array = $lslt;

#print "\@array =\n\n ";
#print "@array\n";

foreach $line (@lslt) {

   chop ($line);

   

   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);


   # you cannot assign a string as an array by doing:
   # "@array = $string", or even, "@line = $line".  Instead,
   # you have to use the split command as below; make
   # sure to use s+ as your argument so that it gets all
   # spaces before a character.
   #
   #
   ($uxacl, $what, $owner, $kbytes, $mo, $dayofmo, $hrmin, $filename) = split (/ +/, $line);

   $mydate = "$mo $dayofmo";

#print "\$filename = $filename\n";
#print "\$owner = $owner\n";
#print "\$mydate = $mydate\n";


# I spoke to Paul and he said this structure
# is useful mainly for formatting page headers;
# it will not work in a loop and he said to use printf
# instead
#
#
#   print "$filename  $owner  $mo $dayofmo \n";



#   format eh_testtable1 =

#   @<<<<<<<< @<<<<< @<<<<<<<<<<<< @>>>>
#   $file,     $owner,    $mydate

#   .

#   $~ = 'eh_testtable';
#   write;

printf ("%s %10s %10s\n", $filename, $owner, $mydate);

$hold = <STDIN>;

}






$hold = <STDIN>;

#$cost = 200;
#$quantity = 4;


#format eh_my_table =

#  Test: @<<<<<<<< @||||| @>>>>>
        $str,     $%,    '$' . int($num)

#.

#$str = "widget";
#$num = $cost/$quantity;


#$~ = 'eh_my_table';
#write;

