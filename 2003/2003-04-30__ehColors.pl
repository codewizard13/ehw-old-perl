#!/usr/bin/perl
#
# Program:     eh_WebColors.pl
# Creator:     Eric Hepperle
# Date:        04/30/03
#
# Purpose:     Uses Perl to demonstrate web colors
#
# --------------------------------------------------
#
# NOTE:  !!! Works !!!
#


# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space
   &initializeVariables();
   &displayThisFileInfo();
   &initializeFoldersAndFiles();
   &getModuleNames();
   &makeColors();

   $webPage = "$progFolder/$plainFileName\_colorPage.html";
   print "\$webPage =";
   print "$webPage\n";

   open (FILE, ">$webPage" );

      foreach $el (@colors)
      {
         print FILE "<font color = #$el>color</font><br>\n";

      } # end for

   close (FILE);

   $hold;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




# uses for loops to create colors
sub makeColors
{
   for ($r = 000; $r < 256; $r++ )
   {
#      print "r =\t$r\n";

      for ($g = 000; $g < 256; $g++ )
      {
#         print "g =\t$g\n";

         for ($b = 000; $b < 256; $b++ )
         {


         } # end for

      } # end for

   $newColor = "$r$g$b";
   @colors = (@colors, $newColor);
   print "\$newColor =\t$newColor\n";

   } # end for

$hold;

} # end sub makeColors



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

   # define folder names to be used
   $mainFolder = "c:/documents and settings/nunya_beezniss/desktop";
   $progFolder = "$mainFolder/PROGRAMMING_PERL_$plainFileName";

   $methodSpacing = "\n\n\n\n";

   # stop until user enters a keystroke
   $hold = <STDIN>;

} # end sub initializeVariables




# serves as "about" function, thanks user for using the program,
#    and initializes some global variables.
sub displayThisFileInfo
{




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
   &makeFile( "$progFolder/$plainFileName\_colorPage.html" );
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




sub getFileNames
{
   print "Enter the names of files that this program";
   print "should create, all on one line:\n";
   $ans = <STDIN>;

   # split the string at spaces & make array
   @files2Make = split(/\s/, $ans);

} # end sub getFileNames




# ----------------------------------------