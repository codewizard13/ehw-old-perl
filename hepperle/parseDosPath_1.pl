
#!/usr/bin/perl
#
# Program:    parseDosPath_1.pl
# Creator:    Eric Hepperle
# Date:       06/28/03
#
# Purpose:    First attempt to parse dos/win32 path
#             i.e.:  c:\windows\desktop\somefile.txt
#
#  DEMONSTRATES how to correctly PARSE a dos/win32 path
#

print "\n\n";

# initialize variables:
$path1 = "c:\documents and settings\lib007\desktop\doc1.txt";
$path2 = 'c:\documents and settings\lib007\desktop\doc1.txt';
$path3 = `c:\documents and settings\lib007\desktop\doc1.txt`;

@paths = ( $path1, $path2, $path3 );


# test parser:
#
# TESTING PATH 1
print "Testing \$path1 ...\n\n";


foreach $el (@paths)
{
   $count = 1;  # initialize count

   @pieces = split(/\\/, $el);

#   @pieces = split(/\./, $_[0]);


   print "#-----------------------------------------#\n\n";
   print "These are the pieces of $el:\n\n";

   foreach $piece (@pieces)
   {
      print "$count)  $piece\n\n";
      $count++;
   } # end foreach

   print "END $el\n\n\n\n";

} # end foreach




$hold = <STDIN>;


# TRACING:
# Testing system command

$prog1 = 'c:\program files\winamp\winamp.exe';

# ver 1:  system( $prog1 )

system( "$prog1" );



$hold = <STDIN>;