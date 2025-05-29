#!/usr/bin/perl

# Date:    05/03/03


# ----------------------------------------\\

$mainDir = "c:/documents and settings/nunya_beezniss/desktop";
$defaultFile = "$mainDir/ehColors.pl";

main();
sub main
{
   &reportComments;

   $hold = <STDIN>;

} # end sub main



sub reportComments
{
   # read file into an array
   print "Enter the directory the file is in or press enter to choose:\n";
   print "\t$mainDir\n\n";
   $dir = <STDIN>;
   chomp($dir);

   if ($dir eq "")
   {
      $dir = $mainDir;

   } # end if

   print "Enter the name of file to read:\n\n";
   $file = <STDIN>;
   chomp($file);

   if ($file eq "")
   {
      $file = $defaultFile;

   } # end if

   $file = "$dir/$file";

   print "The file you entered was:\t$file\n\n";

   # store file in an array
   open(FILE, "$file");
      @fileArray = <FILE>;
   close(FILE);

   # verify contents of array
   print "Press <ENTER> to continue ...\n\n";
   $hold = <STDIN>;
   print "The array contents are:\n";
   print "########################################\n\n";

   # TRACING:
   foreach $el (@fileArray)
   {
      print "$el";
   }

   print "\n\n";

   print "Press <ENTER> to continue ...\n";
   $hold = <STDIN>;

   $outFile = "$mainDir/out.txt";

   &makeFile("$outFile");

   &isComment;

} # end sub reportComments



sub isComment
{
   # determine if a line is a comment
   $lineCount = 1;

   open (FILE, ">$outFile");

   foreach $line (@fileArray)
   {
      if ($line =~ /^#/)
      {
         print "Line $lineCount:";
         print "   $line";

         print FILE "Line $lineCount:\t$line";


         $lineCount++;

      } # end if

   } # end foreach

   close(FILE);

} # end sub isComment



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
