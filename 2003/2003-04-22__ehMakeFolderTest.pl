#!/usr/bin/perl
#
# Program:     ehMakeFolderTest.pl
# Creator:     Eric Hepperle
# Date:        04/22/03
#
# Purpose:     Create a method for creating a folder
#              using passed vars and subroutines,
#              and existence checking.
#
# --------------------------------------------------
#
# NOTE:  !!! Works !!!
#


# define main folder name
$mainFolder = "c:/documents and settings/nunya_beezniss/";
$mainFolder .= "desktop/web_link_list_dir";

&makeFolder();


for ($count=1; $count <= 10; $count++)
{
 makeFolder( "$mainFolder/folder$count" );
}



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




# ----------------------------------------
# stop until user enters a keystroke
$hold = <STDIN>;