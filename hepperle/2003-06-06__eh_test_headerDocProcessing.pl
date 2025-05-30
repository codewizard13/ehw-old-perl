#!/usr/bin/perl
#
# Program:     eh_test_headerDocProcessing.pl
# Creator:     Eric Hepperle
# Date:        06/01/03
#
# Purpose:     Test of header processing subs.
#
# !!! WORKS SO FAR !!!


# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space
   &initializeVariables();
   &makeFoldersAndFiles();
   &makePrelimDocumentation();
   &convertDocHeader();
   &finalizeHeaderDoc();
   &initMessage();

   # TRACING:
   wrap( $message, 40 );

   $hold = <STDIN>;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




#
sub initializeVariables
{
   $plainFileName = &baseName($0);

   # define folder names to be used
   $mainFolder = "c:/documents and settings/nunya_beezniss/desktop";
   $progFolder = "$mainFolder/PROGRAMMING_PERL_$plainFileName";
   $documentationHolder = "$progFolder/docHold.dat";
   $convertedHeader = "$progFolder/convHeader.dat";
   $finalHeaderDoc = "$progFolder/finalHeader.dat";

   # used to calculate num of spaces to add to end of line
   # in documentation header creation
   $remainingDocChars = 65;

   $tenStr = "**********";
   $documStartBorder = "/$tenStr$tenStr$tenStr$tenStr$tenStr$tenStr****";
   $documEndBorder = "$tenStr$tenStr$tenStr$tenStr$tenStr$tenStr****\\";

} # end sub initializeVariables




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




sub initMessage
{
   $message = "If the starting position is before the beginning";
   $message = "$message of the string (like a huge negative number bigger";
   $message = "$message than the length of the string), the beginning of";
   $message = "$message the string is the start position (as if you had";
   $message = "$message used 0 for a starting position). If the start";
   $message = "$message position is a huge positive number, the empty";
   $message = "$message string is always returned. In other words, it";
   $message = "$message probably does what you expect it to do, as long";
   $message = "$message as you expect it to always return something";
   $message = "$message other than an error.";

   return $message;

} # end sub initMessage




sub countAllChars
{
   my ($str) = @_;

   @charArray = split(//, "$str");

   $charCount = $#charArray + 1;

   print "\$#charArray = $charCount\n\n";

   return $charCount;

} # end countAllChars




sub makePrelimDocumentation
{
   print "The name of this program is:\t $0\n\n";

   print "Enter Program name:  ";
   $progName = <STDIN>;
   chomp($progName);
   print "\n";
   #
   print "Enter Creator name:  ";
   $creator = <STDIN>;
   chomp($creator);
   print "\n";
   #
   print "Enter Date (mm/dd/yy):  ";
   $createdDate = <STDIN>;
   chomp($createdDate);
   print "\n";
   #
   print "Enter Program Description (CTRL-Z to Quit):\n\n";
   @progDescr = <STDIN>;
   chomp( @progDescr );

   if ( @progDescr == "" )
   {
      @progDescr = &wrap( $message, 40 );
   }

   # open $documentationHolder for write
   open( HOLDER, ">$documentationHolder");

      print HOLDER "*   Program:    $progName\.java\n";
      print HOLDER "*   Creator:    $creator\n";
      print HOLDER "*   Date:       $createdDate\n";
      print HOLDER "*   \n";

      # store purpose heading and data as a string
      $purpose = "*   Purpose:    @progDescr\n";

      foreach $line (@progDescr)
      {
         print "\n\n\@progDescr line = $line\n\n";

      }

      # break $purpose into strings of length 40
      @purposeArray = &wrap( $purpose, 40 );

      $purposeCharCount = &countAllChars( $purpose );
      print "Number of chars in \$purpose = $purposeCharCount\n\n";

      $patternToMatch = "*   Purpose:";
      foreach $line (@purposeArray)
      {
         print "IF STATEMENT STARTS HERE ......................\n\n";

         # if line starts with "*   Purpose:" ..
         if ( $line =~ /\^$patternToMatch\b/ )
         {
            print "The sentence contains the pattern $patternToMatch!\n";
            print HOLDER "$line\n";
         }
         else
         {
            print HOLDER "*               $line\n";

         } # end if

      } # end sub purposeArray


   close( HOLDER );

} # end sub makePrelimDocumentation




sub convertDocHeader
{
   # store docHolder in an array
   open( HOLDER, "$documentationHolder" );
      @holder = <HOLDER>;
   close( HOLDER );

   # open converted header doc
   open( CONV, ">$convertedHeader" );

   foreach $line (@holder)
   {
      chomp($line);
      $charsInLine = &countAllChars( $line );
      $spacesToAdd = $remainingDocChars - $charsInLine;

      print "Spaces To Add =\t$spacesToAdd\n\n";

      # make a string of spaces based on count.
      $count = 1;
      $spaces = "";
      while ( $count < $spacesToAdd )
      {
         $spaces = "$spaces ";

         $count++;

      } # end while

      $line = "$line$spaces*\n";

      print CONV $line;

   } # end foreach

   close( CONV );

} # end sub convertDocHeader




sub finalizeHeaderDoc
{
   open( CONV, "$convertedHeader" );
      @conv = <CONV>;
   close( CONV );

   open( FINAL, ">$finalHeaderDoc" );
      print FINAL "\n\n\n\n";
      print FINAL "$documStartBorder\n";

      foreach $line (@conv)
      {
         print FINAL $line;

      } # end foreach



      print FINAL "$documEndBorder\n";
      print FINAL "\n\n\n\n";

   close( FINAL );

} # end sub finalizeHeaderDoc




# WORKS
sub wrap
{
   my ( $str, $len) = @_;

   $strLen = &countAllChars( $str );
   $restOfStr = $str;
   $wrappedStr = "";
   $charCount = 0;
   $lineCount = 1;
   $currentLine = "";

   while ( $strLen > $len )
   {
      # is charCount a multiple of specified line length?
      if ( $charCount % $len == 0  && $charCount != 0 )
      {
         print ( "LINE $lineCount: $currentLine\n" );
         #
         # store line in an array
         @lineArray = ( @lineArray, $currentLine );

         print ( "charCount =\t$charCount" );
         $currentLine = substr( $restOfStr, 0, $len );

         $restOfStr = substr( $restOfStr, $len );

         $wrappedStr = "$wrappedStr$currentLine\n";

         $strLen = countAllChars( $restOfStr );

         $lineCount++;

      } # end if

      $charCount++;

   } # end while

   print ( "LINE $lineCount: $currentLine\n" );
   print "\$restOfStr =";
   print "$restOfStr\n\n";
   $wrappedStr = "$wrappedStr$restOfStr";
   @lineArray = ( @lineArray, $currentLine, $restOfStr );

   print ( "\nrestOfString =\t$restOfStr\n" );
   print ( "$tenStr$tenStr$tenStr$tenStr\n" );

   print ( "\n\n\n" );
   foreach $line (@lineArray)
   {
      print "$line\n";

   } # end foreach

   print "\n\@lineArray =\n";
   print "@lineArray\n\n";

   return @lineArray;

} # end sub wrap




sub makeFoldersAndFiles
{
   &makeFolder( "$progFolder" );

   &makeFile ( "$documentationHolder" );
   &makeFile ( "$convertedHeader" );
   &makeFile ( "$finalHeaderDoc" );

} # end makeFoldersAndFiles




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

} # end sub makeFolder




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

} # end sub makeFile