#!/usr/bin/perl
#
# Program:     eh_test_perlWrap2.pl
# Creator:     Eric Hepperle
# Date:        06/05/03
#
# Purpose:     Test of wrap sub.
#
# !!! WORKS SO FAR !!!


# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space
   &initializeVariables();
   &initMessage();

   wrap( $message, 10 );

   $subString = substr( "fuck", 0, 1 );

   print "\n\nFirst char of fuck is [$subString]\n\n";


   print "Press <ENTER> key to continue ...\n\n";
   $hold = <STDIN>;

   # TRACING:
   print "TESTSTING: listAllChars\n\n";
   listAllChars( $message );


   # TRACING:
   # traceBackChars test
   $y = countAllChars( $message );
   print "countAllChars( \$message ) = $y\n\n";
   traceBackChars( $message, " ", countAllChars( $message ) - 1 );


   #-------------------------------------------

   %HASH_1 = wrap( $message, 10 );

   print "\n\n";

   #=========================================
   # print each line in the hash
   #
   print "HASH_1\n";
   foreach $line (keys %HASH_1)
   {
      print "LINE $line is: $HASH_1{$line}\n";

   } # end foreach





   print "\n\n";
   print "SORTED NUMERICALLY ASCENDING BY Key:\n";
   foreach $line (sort keys %HASH_1)
   {
      print $line, '=', $HASH_1{$line}, "\n";

   }




   #-------------------------------------------

   $hold = <STDIN>;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




sub initializeVariables
{
   $tenStr = "**********";
   $tenStarBorder = "$tenStr$tenStr$tenStr$tenStr";

} # end sub initializeVariables




sub initMessage
{
#   $message = "If the starting position is before the beginning";
#   $message = "supercalifragilistic expialadocious";
#   $message = "print the first part and continue";

   $message = "If the starting position is before the beginning";
   $message = "$message of the string (like a huge negative number bigger";
   $message = "$message than the length of the string), the beginning of";
   $message = "$message  the string is the start position (as if you had";
   $message = "$message  used 0 for a starting position). If the start";
   $message = "$message  position is a huge positive number, the empty";
   $message = "$message  string is always returned. In other words, it";
   $message = "$message  probably does what you expect it to do, as long";
   $message = "$message  as you expect it to always return something";
   $message = "$message  other than an error.";


   return $message;

} # end sub initMessage




sub wrap
{
   my ( $str, $len) = @_;

   # initialize wrap variables
   $strLen = &countAllChars( $str );
   $restOfStr = $str;
   $wrappedStr = "";
   $charCount = 0;
   $lineCount = 1;
   $currentLine = "";

   %LINES;

   # while length of line is greater than specified length
   while ( $strLen > $len )
   {
      # first, trace back until find a space
      traceBackChars( $str, " ", $len - 1 );

      $spaceFoundAt = traceBackChars( $str, " ", $len - 1 );
      print "SPACE FOUND AT:  position $spaceFoundAt\n\n";

      # store substring as lineX
      $LINES{$lineCount} =  substr( $str, 0, $len );

      # rest of line
      $str = substr( $str, $len );

      # get new string length
      $strLen = countAllChars( $str );

      $lineCount++;

   } # end while

   # add the rest of string to hash
   $LINES{$lineCount} = $str;



   return %LINES;

} # end sub wrap




sub pCharAt
{
   my ( $str, $charPos ) = @_;

   $ss = substr( $str, $charPos, 1 );

   return $ss;

} # end sub pCharAt




sub countAllChars
{
   my ($str) = @_;

   @charArray = split(//, "$str");

   $charCount = $#charArray + 1;

   #print "\$#charArray = $charCount\n\n";

   return $charCount;

} # end sub countAllChars




sub listAllChars
{
   my ($str) = @_;

   $count = 0;
   $x = countAllChars( $str );
   while( $count < $x )
   {
      $currentLetter = pCharAt( $str, $count );

      print "\$count = $count;\t\$currentLetter = $currentLetter\n\n";

      $count++;

   } # end while

} # end sub listAllChars




sub traceBackChars
{
   my ( $targetStr, $charToFind, $startPosit ) = @_;
   # $targetStr:   string to search in
   # $strToFind:   char to search for

   chomp( $targetStr );

   $charIndex = $startPosit;

   # get current char value
   $currentChar = substr( $targetStr, $charIndex, 1 );

   # as long as current char is not what you
   # are looking for, keep going ...
   while ( $currentChar ne $charToFind )
   {
      # TRACING:
      print "TEST:  \&traceBackChars --\n";
      print "          \$charIndex     =   $charIndex\n";
      print "          \$currentChar   =   $currentChar\n\n";

      $charIndex--;
      $currentChar = substr( $targetStr, $charIndex, 1 );

   } # end while

   # TRACING:
   print " - Found char \"$charToFind\" at indext position:  $charIndex\n\n";

   return $charIndex;

} # end sub traceBackChars




# sort numerically (ascending)
sub sortNumAscend
{
   $a <=> $b;

} # end sub sortNumAscend




