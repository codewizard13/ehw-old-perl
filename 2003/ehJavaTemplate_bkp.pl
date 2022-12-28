#!/usr/bin/perl
#
# Program:     ehJavaTemplate.pl
# Creator:     Eric Hepperle
# Date:        04/22/03
#
# Purpose:     Uses Perl to create Java Programs.
#
# --------------------------------------------------
#
# NOTE:  !!! Works !!!
#
# REVISIONS:   05/28/08 - Wrote code to display day and month.
#

use Cwd;
use File::Basename;



# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space
   &initializeVariables();
   &getTime();
   &displayThisFileInfo();
   &initializeFoldersAndFiles();
   &getModuleNames();
   &getProgHeaderInfo();
   &createOutFile();

   $hold;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




# gets the rightmost part of a directory path after parsing,
#    (i.e. gets the filename from the pathname)
sub baseName
{
   my ($dir) = @_;

   my @dirElements = split(/\\/, $dir);

   $elCount = 0;
   foreach $el (@dirElements)
   {
      print "ELEMENT $elCount:\t$el\n";
      $elCount++;
   } # end foreach

   $dirArrayLength = $#dirElements + 1;
   print "\nlength of \@dirElements = $dirArrayLength\n\n";
   print "\$dirElements[$#dirElements] = $dirElements[$dirArrayLength - 1]\n";

   return $dirElements[$#dirElements];

} # end sub baseName



sub initializeVariables
{
   $plainFileName = &baseName($0);

   $border = "****************************************";

   # define folder names to be used
   $mainFolder = "c:/documents and settings/nunya_beezniss/desktop";
   $progFolder = "$mainFolder/PROGRAMMING_PERL_$plainFileName";

   $methodSpacing = "\n\n\n\n";

   # stop until user enters a keystroke
   $hold = <STDIN>;

} # end sub initializeVariables




sub createOutFile
{
   $outDir  = $0;
   print "\$outDir = $outDir\n\n";
#   $outJavaFile = ";

} # end sub createOutFile




# serves as "about" function, thanks user for using the program,
#    and initializes some global variables.
sub displayThisFileInfo
{
   # open output file
   open(OUT, ">$outJavaFile");

   print "\$0 =\t$0\n\n";
   print "The name of this program is:\t $plainFileName\n\n";

} # end sub displayThisFileInfo




sub getProgHeaderInfo
{
   print "Who is the author? ";
   $author = <STDIN>;
   chomp( $author );

   print "What is the version number? ";
   $version = <STDIN>;
   chomp( $version );

   # TRACING:
   print "\nThe author is ... $author.\n";
   print "The version number is $version\n\n";

   print "Enter program description: (Press \<CTRL\>\+Z to escape)\n\n";
   @progDescription = <STDIN>;

   # TRACING:
   print "\n\@progDescription =\n";
   print "@progDescription\n\n";

} # end sub getProgHeaderInfo




sub makeFolder
{
   my ( $folderName ) = @_;

   # if user did not enter a folder name
   if ( $folderName eq "" )
   {
      print " !!! You did not enter anything\n\n";
   }
   else
   {

      # if folder doesn't exist, create it
      if ( ! -e $folderName )
      {
         # display message to user that folder is being created
         print "\n !!! The folder\n";
         print "     $folderName\n";
         print "     does not exist ... Creating the dir now ...\n\n";

         # create the directory
         mkdir( $folderName, 0755) || die "Cannot mkdir $folderName: $!";

      }
      else
      {
         # display message to user that folder exists already
         print "\n !!! The folder\n";
         print "     $folderName\n";
         print "     already exists.\n\n";

      } # end if

   } # end if

} # end sub createMainFolder




sub makeFile
{
   my ( $fileName ) = @_;

   # if user did not enter a file name
   if ( $fileName eq "" )
   {
      print " !!! You did not enter anything\n\n";
   }
   else
   {

      # if file doesn't exist, create it
      if ( ! -e $fileName )
      {
         # display message to user that file is being created
         print "\n !!! The file\n";
         print "     $fileName\n";
         print "     does not exist ... Creating the file now ...\n\n";

         # create the file
         open(FILE, ">$fileName");        # Open for output
            print FILE "";
         close(FILE);

      }
      else
      {
         # display message to user that file exists already
         print "\n !!! The file\n";
         print "     $fileName\n";
         print "     already exists.\n\n";

      } # end if

   } # end if

} # end sub createMainFile




# --- SUBROUTINE: [ writeJavaAppletSkeleton ] --- \\
sub writeJavaAppletSkeleton
{
   foreach $el (@splitElements)
   {
     print "Element # $elcount:\t$el\n";
     $elcount++;

   } # end foreach

} # end sub writeJavaAppletSkeleton




sub makeFiles
{
} # end sub makeFiles




sub initializeFoldersAndFiles
{
   &makeFolder( "$mainFolder" );
   &makeFolder( "$progFolder" );
   &makeFile( "$progFolder/$plainFileName\_1.txt" );
   &makeFile( "$progFolder/$plainFileName\_2.txt" );
   &makeFiles( @files2Make );

} # end sub initializeFoldersAndFiles




sub getModuleNames
{
   print "Enter the names of modules to import all on one line:\n";
   $ans = <STDIN>;

   # split the string at spaces & make array
   @importModules = split(/\s/, $ans);

} # end sub getModuleNames




sub getTime
{
   @locTime = localtime(time);
   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  @locTime;
   $yyyy = sprintf("%04d",$year+1900);
   $yy = sprintf("%02d", $year%100);
   $mm = sprintf("%02d", $mon + 1);
   $dd = sprintf("%02d", $mday);
   $mmddyy = "$mm$dd$yy";
   $mmddyy_withSlash = "$mm/$dd/$yy";
   $mmddyyyy_withSlash = "$mm/$dd/$yyyy";

   $milHour = sprintf("%02d", $hour);
   $stdHour = sprintf("%02d", $hour - 12);
   $min2Dig = sprintf("%02d", $min);
   $sec2Dig = sprintf("%02d", $sec);
   $suffix = &timeSuf($milHour);
   $miltime = sprintf("%02d:%02d", $hour, $min);
   $stdtime = sprintf("%02d:%02d",$stdHour, $min);
   $hhmmss_std = sprintf("%02d:%02d:%02d $suffix", $stdHour, $min2Dig, $sec2Dig);
   $hhmmss_mil = "$milHour:$min2Dig:$sec2Dig $suffix";



   # TRACING:
   $elCount = 1;
   foreach $el (@locTime)
   {
      print "EL # $elCount:\t$el\n";
      $elCount++;

   } # end foreach


   $stdtime = "$stdtime $suffix";

   print "The date in mmddyy format:       $mmddyy\n";
   print "The date in mmddyyyy with slash: $mmddyyyy_withSlash\n";
   print "The date in mmddyy with slash:   $mmddyy_withSlash\n";
   print "The time in military format is:  $miltime\n";
   print "The time in standard format is:  $stdtime\n";
   print "The time in hhmmss_std format:   $hhmmss_std\n";
   print "The time in hhmmss_mil format:   $hhmmss_mil\n";
   print "\n\n";
   print "\$min2Dig:                       $min2Dig\n";
   print "\$sec2Dig:                       $sec2Dig\n";
   print "\n\n";


   print "year val =\t$locTime[5]\n\n";

   $curMonth = getMonth( $mon + 1 );
   $curDay = getWkDy( $wday );

   print "The month is:                    $curMonth\n\n";
   print "The day is:                      $curDay\n\n";

} # end sub time_mmddyy




sub timeSuf
{
   my ( $milHour ) = @_;

   $stdHour = $milHour - 12;
   print "\n\n\$stdHour =  $stdHour\n";

   if ( $stdHour <= 0 )
   {
      print "\$stdHour = $stdHour, which is >= 0\n";
      $suf = "AM";
   }
   else
   {
      print "\$stdHour = $stdHour, which is > 0\n";
      $suf = "PM";

   } # end if

   return $suf;

} # end timeSuf sub




sub getMonth
{
   my ( $moNum ) = @_;

   if ( $moNum == 1 )
   {
      $moName = "January";
   }
   elsif ( $moNum == 2 )
   {
      $moName = "February";
   }
   elsif ( $moNum == 3 )
   {
      $moName = "March";
   }
   elsif ( $moNum == 4 )
   {
      $moName = "April";
   }
   elsif ( $moNum == 5 )
   {
      $moName = "May";
   }
   elsif ( $moNum == 6 )
   {
      $moName = "June";
   }
   elsif ( $moNum == 7 )
   {
      $moName = "July";
   }
   elsif ( $moNum == 8 )
   {
      $moName = "August";
   }
   elsif ( $moNum == 9 )
   {
      $moName = "September";
   }
   elsif ( $moNum == 10 )
   {
      $moName = "October";
   }
   elsif ( $moNum == 11 )
   {
      $moName = "November";
   }
   elsif ( $moNum == 12 )
   {
      $moName = "December";
   }
   else
   {
      $moName = "INVALID NUMBER";
   }

   return $moName;

} # end sub getMonth




sub getWkDy
{
   my ( $dyNum ) = @_;

   if ( $dyNum == 1 )
   {
      $dyName = "Monday";
   }
   elsif ( $dyNum == 2 )
   {
      $dyName = "Tuesday";
   }
   elsif ( $dyNum == 3 )
   {
      $dyName = "Wednesday";
   }
   elsif ( $dyNum == 4 )
   {
      $dyName = "Thursday";
   }
   elsif ( $dyNum == 5 )
   {
      $dyName = "Friday";
   }
   elsif ( $dyNum == 6 )
   {
      $dyName = "Saturday";
   }
   elsif ( $dyNum == 7 )
   {
      $dyName = "Sunday";
   }
   else
   {
      $dyName = "INVALID DAY NAME";

   } # end if

   return $dyName;

} # end sub getWkDy




sub getFileNames
{
   print "Enter the names of files that this program";
   print "should create, all on one line:\n";
   $ans = <STDIN>;

   # split the string at spaces & make array
   @files2Make = split(/\s/, $ans);

} # end sub getFileNames




# ----------------------------------------