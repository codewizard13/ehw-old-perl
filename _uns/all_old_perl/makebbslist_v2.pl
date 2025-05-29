#!/usr/bin/perl

# Program:	makebbslist_v2.pl
# Creator:	Eric Hepperle
# Date:	12/16/01



use LWP::Simple;


# define count variable:
$count = 1;

$home = "c:/windows/desktop";

print "Enter the path to zep's guide:\n\n";
$path = <STDIN>;
chomp $path;

if ($path eq "") {
   # set default zep's path:
   $path = "D:/speshal/SPESHAL_Pages/Zeps Guide 121101.htm";

}


print "Here is the path that will be used: \n\n";
print "$path\n\n";

print "(PRESS ENTER TO CONTINUE)\n";
$hold = <STDIN>;


# open stored zeps guide and store in an array:
open (ZEPS, "$path");
   @zepsary = <ZEPS>;
close (ZEPS);

# define a file to hold results.
$results = "c:/windows/desktop/zepresults.html";

# open result file for writing.
open (RESULTS, ">$results");

   print RESULTS "<HTML>\n\n";
   print RESULTS "<HEAD>\n";
   print RESULTS "<TITLE>ZEP'S RESULTS</TITLE>\n";
   print RESULTS "</HEAD>\n\n";
   print RESULTS "<BODY BGCOLOR = BLACK TEXT = LIME>\n\n";

   # read each line in the html doc ...
   foreach $line (@zepsary) {

      # if line contains "http://", then ...
      if ($line =~ /http:\/\//) {

         # split line at spaces.
         @spline = split(/\s+/, $line);
         
         # scan each element of resulting array.
         foreach $el (@spline) {

            # Tracing:
            print RESULTS "count = $count<BR>\n\n";
            
            
            # if the element contains "http:" ...
            if ($el =~ /http:/) {

               $x = $count - 2;

               $bbsnm = $spline[$x];
               $bbsurl = $spline[$count];

               $line = "$bbsnm = <A HREF = \"$bbsurl\">$bbsurl</A>\n\n";


               $count++;

            }
            print RESULTS $line;
         }

         

      }

   }


   print RESULTS "</BODY>\n</HTML>\n\n";


close (RESULTS);


$openres = "c:/Program Files/Internet Explorer/iexplore.exe $results";
$openres;


# This is the line that retrieves the html code.
#@file = get ($url);


#print "Press enter to see the contents of the url:\n";
#$hold = <STDIN>;


#print "\n\n@file\n\n";
print "### THE END ###\n\n";

$hold = <STDIN>;
