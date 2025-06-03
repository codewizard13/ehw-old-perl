#!/usr/bin/perl
# File searchfileforavi.pl created by Eric Hepperle at 14:06:58 on Wed Sep 26 2001. 



print "\n\n";

print "Enter filename to search:\n";



#actually this should make an array from a listdir routine.
#for each filename in the array this program will read the
#  filename and run the following process:

#1) open the file and assign it's contents to an array or a string,
#(string may work better).
#
#2) search the string or array for the string "avi".
#
#3) pullout the filename based on boundary designations.
#
#4) print filename to a logfile.
#
####################################################


$tmppath = "/afs/rchland.ibm.com/usr3/v2cib484/tmp";

$teststring = "fkjlkasjlkfj kjasdfkjslkdjf dkfjk this is * dfj  @ !@##$$%%^^$^$^$^#^$^$%&$^$%%#%#%$#%$#%$#$#% # # #### #### # $alpha number kit f&n!!!@ # Vampire In Brooklyn.avi # ############## ######## 456";

$testfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/edonkey.test1.txt";

$bell = "\007";

print $bell;
print $bell;
print $bell;


print "\n";

   if ($teststring =~ /#[ ].+\.avi[ ]#/) {

      print "I found the string $_ \n";

   } else {

      print "I found nothing. \n\n";

   }


$result1 = $&;

print "$result1\n\n";


# Take result and parse it at #sp.

@resultarray = split (/#\s/, $result1);

foreach $el (@resultarray) {

   print "\$el = $el\n";

   if ($el =~ /.avi/) {

      $theone = $el;

   }

}

print "\n\n";

print "This is the one: $theone\n\n";

$aviname = $theone;

# assume that it will always have a space and a # afterwards,
# and chop the string twice to remove them.
#
chop $aviname;
chop $aviname;

print "Here is the movie file name: $aviname\n\n";


# write movie name to a logfile.
$movielog = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/movielog.ez";

$file = "file:///$movielog";

open (MOVIELOG, ">>$movielog");

   print MOVIELOG "$aviname\n";

close (MOVIELOG);


# make a version of the title where spaces are replaced w/ underscores.
#
$uscoreavi = $aviname;
substr($uscoreavi, 0) =~ s/\s/_/g;

print "The underscored version is: $uscoreavi\n\n";


# opens $movielog w/ netscape.
system("netscape $file");



#------------------------------------------#
#


$file2rename = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/file2rename.part.txt";

$newfilename = "$tmppath/$uscoreavi";

print "The new file will be called: \n";
print "$newfilename \n";

rename($file2rename, $newfilename) || die "Cannot rename $file2rename: $!";
