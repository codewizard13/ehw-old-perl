#!/usr/bin/perl

# Program:	makebbslist.pl
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
   print RESULTS "<H2><FONT FACE = \"comic sans ms\" COLOR = LIGHTSKYBLUE>\n";
   print RESULTS "\t\tZEP's LINKS (Revised)</FONT></H2>\n\n";
   print RESULTS "<FONT FACE = \"Arial\" COLOR = LIME>\n\n";
   print RESULTS "<BR>\n";

   # read each line in the html doc ...
   foreach $line (@zepsary) {

      $count = 1;

      # if line contains "http://", then ...
      if ($line =~ /http:/) {

#         substr($line, 0) =~ s/<\/A><BR>/<\/A>\n<BR>/g;
#         substr($line, 0) =~ s/\n/<BR>/g;

         substr($line, 0) =~ s/\;\&nbsp/ /g;

         print RESULTS "<BR>\n";

         # split line at spaces
         $spline = split(/=/, $line);

 

         substr($line, 0) =~ s/  href=/<a href =/g;
  
         substr($line, 0) =~ s/\n/ /g;

         substr($line, 0) =~ s/\s+/ /g;

         substr($line, 0) =~ s/<BR>\n\s+target=/ target =/g;

         substr($line, 0) =~ s/<\/A><BR>/<\/A>\n<BR>/g;

         substr($line, 0) =~ s/ <BR> target/ target/g;

         substr($line, 0) =~ s/<\/A>/\n\n<BR><\/A>/g;

         substr($line, 0) =~ s/ <BR>\n/\n/g;

         # protect the <BR></A> combo's.
#         substr($line, 0) =~ s/<BR><\/A>/SUPERCALIFRAGILISTIC/g;

         # replace all other <BR>'s w/ space.
#         substr($line, 0) =~ s/<BR>/[ ]/g;
#         substr($line, 0) =~ s/$<BR>\s+\n/[ ]/g;


         print RESULTS $line;

      }

   }


   print RESULTS "</FONT>\n</BODY>\n</HTML>\n\n";


close (RESULTS);





#$openres = "c:/Program Files/Internet Explorer/iexplore.exe $results";
#$openres;


# This is the line that retrieves the html code.
#@file = get ($url);


#print "Press enter to see the contents of the url:\n";
#$hold = <STDIN>;


#print "\n\n@file\n\n";
print "### THE END ###\n\n";

$hold = <STDIN>;
