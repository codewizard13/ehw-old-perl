#!/usr/bin/perl -w
#
#
# Program:	delvol_multi.pl
# Creator:	Eric Hepperle
# Date:		12/11/01
#
# Purpose:	(Based on my c-shell script: eh_delvol2.2.csh).  Lets user input and save a list of volumes to delete and then deletes them one by one [actually, I think it marks them for deletion].
#
#		Separates AFS volumes from DFS volumes
#		in a list file by matching character  
#		strings, and stores AFS volume names  
# 		in a new list file.
#
###################################################
#
# Revisions:
#
#	12/11/01  - Original.
#
#	12/12/01  - Fixed script so it now updates
#		    the correct files appropriately,
#		    (i.e. writes output to log file,
#		    etc...).
#
#	12/13/01  - Must be admin to delete volumes.
#		    Made a note of that and it
#		    does the deletes just fine now.
#
#		    !!!!!  WORKS GREAT  !!!!!
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

use Cwd;



###################################################
# DEFINE VARIABLES:                               #
###################################################
#

$dir = cwd;

$ez = '/usr/tools/bin/ez';

$storagedir = "/afs/rchland.ibm.com/usr3/v2cib484/public/delete_volumes.dir";

$temp_delfile = "$storagedir/voldeltemp.txt";
$final_delfile = "$storagedir/voldelfinal.txt\n";
$delvol_log = "$storagedir/delvol.log\n";

$tdate = scalar(localtime);



###################################################
# Create On-Screen Header:                        #
###################################################

						
print "***************************************************";			
print "\n\n";
print "This program is called $0\n";
print "Today = $tdate\n\n";
print "cwd = \$dir = $dir\n\n";



###################################################
# GET INFO FROM USER:                             #
###################################################
#


#--------------------------------------------------
# Print instructions to the screen:
#


print "\n\n";
print "This program takes a temporary file list which consists of\n";
print "a list of volume names, afs and dfs, which is separated by\n";
print "this program.  The user will have the option at the end to\n";
print "delete the afs files (right now, those are the ones that \n";
print "begin with the prefix \"lde\").\n";
print "\n";
print "The user must first copy the list of volume names to delete\n";
print "from an email or some other text medium, to the temporary file\n";
print "designated to hold these for processing.\n";
print "\n";
print "To open the temporary file, press <ENTER> when ready.\n";
print "Paste the list of volumes to delte and save.\n\n";

$hold = <STDIN>;


$opentempdel = `$ez $temp_delfile`;

$opentempdel;


# Create header for delvol log file:

open (DELLOG, ">>$delvol_log");
open (FINAL, ">$final_delfile");

   print DELLOG "##############################################################\n"; 
   print DELLOG "\n\n";								       
   print DELLOG "$tdate\n";							       
   print DELLOG "--------------------------------------------------------------\n";  
   print DELLOG "\n";


   #***************************************************


   # store contents of temp_delfile in an array.
   open (TEMPDEL, "$temp_delfile");
      @tempdelfile = <TEMPDEL>;
   close (TEMPDEL);

#   print "HERE IS \@tempdelfile = \n";
#   print "@tempdelfile\n\n";


   
      #-------------------------------------------------
      # (We would like to determine whether the volume
      # is afs by reading the path as follows:
      #
      # - read the first part of the path that the volume
      # is mounted under At this point, we are forced to
      # use this method, until somebody comes up with
      # something better)
      # Get the first part before period (lde, dv2k, etc ...)
      #
      # This is the best way I have found w/ c-shell:
      #
      # $pt1 = `awk -v dir=$line 'BEGIN {split(dir,a,"."); print a[1]; exit}'`


      foreach $volname (@tempdelfile) {

         # remove newline char:
         chomp $volname;


         # Tracing:
          print "volname = $volname\n";



         # !!!!!!!!  CAUTION   !!!!!!!!!!!!!!
         #
         # split each volume name into its component parts
         # at the periods; must use "\." to break at the
         # (.)'s.
         @splitvolname = split(/\./, $volname);

         # Tracing:
 #        print "splitvolname = \n";
 #        print "@splitvolname\n\n";

         $cnt = 1;


#         # foreach element in the array @splitvolname ...
#         foreach $el (@splitvolname){
#
#            # print the array elements in a numbered list.
#            print "element $cnt =	$el\n";
#
#            # increment count variable.
#            $cnt++;
#
#         } # END FOREACH.


         # Tracing:
         print "\n";

         $first = "@splitvolname[0]";


         # If the volume name starts w/ 'lde' ...
         if ($first eq "lde" || $first eq "x") {
      
            print DELLOG "\n";
            print DELLOG "Writing volume name to file ... \n";

            $vol2del = $volname;

            # Tracing:
            print "\$vol2del = $vol2del\n";
            print "\n";

            print DELLOG "$volname\n";
            print FINAL "$volname\n";

            print DELLOG "The volume $volname has been successfully written to $final_delfile.\n";


         } else {

            print "first = $first\n\n";

         }


  }



close (FINAL);

close (DELLOG);


###########################################################
# OPEN REPORTS ON SCREEN AND PRINT OUT COPIES TO PRINTER: #
###########################################################


# make a variable that pauses until user presses a key.
print "Press <ENTER> to continue.\n";
$hold = <STDIN>;

system ("netscape $final_delfile");

# call the delete volume subroutine:
&deletevolsub;

#system ("netscape $delvol_log");
#cat $delvol_log | lpr




sub deletevolsub {

###########################################################
# DELETE THE VOLUMES:					  #
###########################################################

# Print divider to screen:
#
print "###################################################\n";
print "\n\n";
print "\n\n";

# Ask user if they want to delete the volumes now.
print "Do you want to delete the volumes now?\n";
print "NOTE:	You must be admin to do this operation.\n";
$ans = <STDIN>;
chomp $ans;

print "\n\n";

# If answer is y or Y then run the delte command ...
if ($ans eq "y" || $ans eq "Y") {

   print "Marking volumes for deletion ...\n\n";


   # DELETE EACH VOLUME IN LIST FILE:
   $markvolume = `/afs/rchland.ibm.com/usr0/admin/bin/delete.volume -v -f $final_delfile  >> $delvol_log`;

   $markvolume;


} else {

   # Otherwise, end program w/ detailed message.
   print "The volumes have not been deleted.\n";
   print "\n";
   print "Have a good day\n\n";
   print "\n";

}

print "\n";
print "-----------------\n";
print "Thank you for using this script: $0 \n";


system ("netscape $delvol_log");

}
