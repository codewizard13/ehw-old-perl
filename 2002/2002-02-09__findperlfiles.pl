#!/usr/bin/perl
#
#
# Program:	findperlfiles.pl
# Creator:	Eric Hepperle
# Date:		12/14/01
#
# Purpose:	Searches the eh.perl.dir directory for all perl files and parses/manipulates them.  The output is saved in a comma-separated-value file (CSV) for importing into Spreadsheet program (Lotus 123, Excell, etc...).  Uses format and write commands.
#
###################################################
#
# Revisions:
#
#	12/14/01 - ORIGINAL.
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
print "This program is called findperlfiles.pl\n\n";


$curtime = scalar(localtime);

print "CURRENT TIME:  $curtime\n\n";

@splittime = split(/\s+/, $curtime);

$thisyear = $splittime[4];

# Tracing:
print "Current Year = $thisyear\n\n";



$~ = STDOUT_TOP;
write;

# define default perl directory.
#$perldir = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir";
$perldir = "c:/windows/desktop/EHFILES_1201/eh_perl_my_scripts.dir/eh_perl_dir_011402/perl.misc.dir";

# open perl dir and store in an array:
opendir (PERLDIR, $perldir);
   @catperldir = readdir(PERLDIR);

#@catperldir = `/usr/bin/ls -lat $perldir`;
#@catperldir = system ("dir $perldir");

#
# TRACING:
print "CATPERLDIR = ";
foreach $filename (@catperldir) {
   print "FILE:\t $filename\n\n";
}
$hold = <STDIN>;


foreach $line (@catperldir) {

   chomp $line;

   # split line at spaces.
   @spline = split (/\s+/, $line);

   # NOTE:	Use $variable[x] instead of array
   #		@array[x].
   #

   $file = $spline[8];

   $mo = $spline[5];

#   print "\n$line = $line\n\n";

   $day = $spline[6];

   $yr = $spline[7];

   # if year contains :, then it is a time and year is current year.
   if ($yr =~ /:/) {

      # year = current year.
      $yr = $thisyear;

   }


   # define date joined w/ underscores.
   $date = join('_', $mo, $day, $yr);


  
   $~ = REPORT;

   write;

}


# Set Header format:
   format STDOUT_TOP =
                             Passwd File

   AFS ID:       Employee Name:      Serial #:
   ------------------------------------------------------------------
.     


# Set Data format:
   format REPORT =
    @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   @<<<  @<<  @<<<< @<<<<<<<<<<
    $file,                                   $mo,  $day,$yr,  $date,
.



sub getdescription {






}

#----------
$hold = <STDIN>;