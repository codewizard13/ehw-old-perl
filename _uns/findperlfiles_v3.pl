#!/usr/bin/perl
#
#
# Program:        findperlfiles_v2.pl
# Creator:        Eric Hepperle
# Date:        12/14/01
#
# Purpose:        Searches the eh.perl.dir directory for all perl files and parses/manipulates them.  The output is saved in a comma-separated-value file (CSV) for importing into Spreadsheet program (Lotus 123, Excell, etc...).  Uses format and write commands.
#
###################################################
#
# Revisions:
#
#        12/14/01 - ORIGINAL.
#
#        02/10/02 - Edited for pc use.
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
#
# TRACING:
print "\$curtime =";
print "$curtime\n\n";
$hold = <STDIN>;

print "CURRENT TIME:\t $curtime\n\n";

@splittime = split(/\s+/, $curtime);

$thisyear = $splittime[4];
$thisdow = $splittime[0];
$thismo = $splittime[1];
$thisdom = $splittime[2];
$timenow = $splittime[3];

# Tracing:
print "Current Year =\t $thisyear\n";
print "Day of Week =\t $thisdow\n";
print "Current Month =\t $thismo\n";
print "Day of Month =\t $thisdom\n";
print "Current Time =\t $timenow\n\n";
$hold = <STDIN>;


#------------------------------------------#
$~ = STDOUT_TOP;
write;

# define default perl directory.
#$perldir = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir";
$perldir = "c:/documents and settings/nunya_beezniss/desktop/all_old_perl";

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

   # NOTE:        Use $variable[x] instead of array
   #                @array[x].
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