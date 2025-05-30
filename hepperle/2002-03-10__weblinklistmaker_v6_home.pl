#!/usr/bin/perl
#
#
# Program:	weblinklistmaker_v6_home.pl
# Creator:	Eric Hepperle
# Date:	11/26/01
#
# Purpose:	To create a template for making subject-classified weblink list.  Output is an html document with table and hyperlinks.
#
###################################################
#
# Revisions:
#
#	- Original:  11/26/01
#
#	02/26/02 - Converted for PC.
#
#	02/27/02 - Was having problems w/ code
#		     (instead of results) being
#		     written to table file.
#		     Problem was resolved when I
#		     realized that I was trying to
#		     write and read simultaneously.
#
#		     !!! WORKS NOW !!!
#
#	03/01/02 - Added code to update menu.
#		     
#
###################################################
#
# Planned Improvements:
#
###################################################
#


#---------------------------------------------------
# Define static source files and directories:
$maindir = "c:/windows/desktop";
$secdir = "$maindir/linklists.dir";


# if secdir doesn't exist, create it.
if (-e $secdir) {
   print "[$secdir] ALREADY EXISTS\n\n";
   $hold = <STDIN>; 
} else {
   print "[$secdir] doesn't exist ... Creating ...\n\n";
   mkdir ($secdir, 777); #|| die "could not create MAIN Dir: $!
   $hold = <STDIN>;
}

$menufile = "$secdir/menufile.txt";
$listfile = "$secdir/ehlinklist.txt";

print "\n";
print "This program is called weblinklistmaker_v6_home.pl\n\n";

&user_interface;






#----------
$hold = <STDIN>;




####################################################
# SUBROUTINES:
####################################################



#--------------------------------------------------------#
# SUB USER INTERFACE:
#
# Creates Menu For User by storing contents
# of text file in a hash.  Lets user choose a menu
# item and then opens the corresponding link list doc.
#
sub user_interface {

   # Greet the user:
   print "======================================================\n\n";
   print "\tThank you for using this program:\n";
   print "\t[$0]\n\n";
   print "======================================================\n\n";

   # if menu file exists ... 
   if (-e $menufile) {
      $count = 1;
      open (MENUFILE, $menufile) || die "cannot open [$menufile]: $!\n\n";
         # assign the file contents to an array.
         @menuarray = <MENUFILE>;
         
         foreach $line (@menuarray) {
            chomp $line;
            #
            # TRACING:
            # print "line [$count]:\t $line\n";

            # Assign each line item to a hash item:
            $topic{$count} = $line;

            $count++;
         } # end foreach loop.

      close (MENUFILE);

   # Or else, quit program w/ msg:
   } else {
      print "MENU FILE [$menufile] does not exist:\n";
      print "Program cannot continue ...\n";
      exit;
   }
   print "\n";

   #-----------------------------------------------
   # Define 'other' menu option (to add a topic to menu):
   #
   $topic{O} = "Other";

  
print "\n";

   # print out hash contents as menu:
   while ( ($key, $value) = each %topic) {
      print "$key = $value\n";
   } 

#foreach $key (sort (keys(%topic))) {
#   print "$key = $value\n";
#}



   print "\n";


   # Let user choose topic category:
   print "Please choose a number corresponding to appropriate topic above for your url: ";

   $choice = <STDIN>;
   chomp $choice;
   print "\n";

   print "Your choice was\t [$choice]: $topic{$choice}\n\n";
   $hold = <STDIN>;




   #-------------------------------------------------------
   # Define Topic file name:
   #
   $topic_choice = $topic{$choice};
   
   # if choice = O(ther) ...
   if ($choice eq "O") {

      # let user add new item to menu.
      print "Enter the name of the new topic:\n\n";
      $topic_choice = <STDIN>;
      chomp $topic_choice;
      print "\n";

      # open menufile for append and write choice to it.
      open (MENUFILE, ">>$menufile");
         print MENUFILE "$topic_choice\n";
      close (MENUFILE);


   }
    

   # remove spaces from topic name and join result:   
   @sp_tc = split(/\s+/, $topic_choice);
   $topicname = join("", @sp_tc); 
   
   # convert topic name to lower case.
   $topicname = "\L$topicname";
   

   # TRACING:
   print "\$topicname:\t $topicname\n\n";

  
   $tablefile = "$secdir/linklist_$topicname\_table.html";
   print "tablefile = [$tablefile]\n\n";
   $hold = <STDIN>;

   # define list file.
   $listfile = "$secdir/listfile_$topicname\.txt";

   


   #------------------------------------------------------
   # If Table of Links doesn't exist already, create it.
   #
   &maketablefile;

   #------------------------------------------------------
   # Make outhtml from tablefile
   # 
   &makeoutfile;

}




#--------------------------------------------------------#
# SUB MAKE TABLE FILE:
#
# Specifically creates table file if it doesn't exist
# already, otherwise it appends it.  Must have table file
# before creating linkpage.
#
sub maketablefile {

   if (-e $tablefile) {
      print "YES: The file [$tablefile] already exists ...\n\n";
   } else {
      print "NO: The table file does not exist:\n";
   }

      print "Press any key to begin entering urls and making add to the list file\n\n";
      $hold = <STDIN>;

      # make the html code for the table subroutine:
      &maketablerows;      

     

}





#--------------------------------------------------------#
# SUB ENTER URLS:
#
# Specifically creates list file if it doesn't exist
# already, otherwise it appends it.
#
sub enterurls {

   # open listfile file for append.
   open (LISTFILE, ">>$listfile");
   #
   # TRACING:
   print "JUST OPENED url list file:\n";
   print "[$listfile]\n\n";

      print "ENTER URLS BELOW:\n";
      print "==========================================\n\n";

      $ans = "x";
      while ($ans ne "q") {


         print "Type a fully qualified url below or [quit] to indicate you are finished:\n\n";
         $ans = <STDIN>;
         chomp $ans;
         print "\n";

         unless ($ans eq "q") {
            # write url to list file.
            print LISTFILE "$ans\n";
         }

      }

   close (LISTFILE);


}





#--------------------------------------------------------#
# SUB MAKE TABLE ROWS:
#
# Formats output with html tags and writes to table file.
#
sub maketablerows {

  
   # if the list file exists ...
   if (-e $listfile) {
      print "THE LIST FILE [$listfile] ALREADY EXISTS.\n\n";
   # otherwise print message saying so and end program.
   } else {
      print "THE LIST FILE [$listfile] DOES NOT EXIST\n\n";
   }

 
   # let user enter new urls.
   &enterurls;


   # after you have entered all your urls,
   # open listfile and read into an array.
   open (LISTFILE, $listfile);
      @listfilearray = <LISTFILE>;
   close (LISTFILE);
   #
   # TRACING:
   $count1 = 1;
   foreach $el (@listfilearray) {
      print "ELEMENT [$count1]:\t $el\n";
      $count1++;
   }
   $hold = <STDIN>;

   

 
   # open tablefile for writing;
   open (TABLEFILE, ">>$tablefile");

      foreach $line (@listfilearray) {

         chomp $line;

         # TRACING:
         print "\$line = $line\n";

         # parse url:
         #($item, $weburl, $descript) = split(/,/, $line);
         #print "$item\n";
         #print "$weburl\n";
         #print "$descript\n";

         $weburl = $line;
         print "\n";
         $hold = <STDIN>;

         # copy $weburl to other var, for preservation.
         $urllink = $weburl;

         # if the url begins with www ...
         if ($urllink =~/^www./) {

            # add the 'http://'.
            $urllink = "http://$urllink";

            # Tracing:
            print "\$weburl = $weburl and \n";
            print "\$urllink = $urllink .\n\n"; 
            $hold = <STDIN>;

         }
      

         # if there is no description, print default msg.
         if ($descript eq "") {
            $descript = "<font size = 2 face = arial color = lemonyellow><U>No Description Available</U></font>\n";
         }

         print TABLEFILE "<!---- NEW ROW -------------->\n";
         print TABLEFILE "<TABLE BORDER = 0>\n";
         print TABLEFILE "<TR>\n";
         print TABLEFILE "<TD width = 50>$item </TD>\n";
         print TABLEFILE "<TD width = 450><a href = \"$urllink\" TARGET = \"TOP\"><FONT FACE = ARIAL SIZE = 2>$weburl</FONT></TD>\n";
         print TABLEFILE "<TD width = 300>$descript<BR></TD>\n";
         print TABLEFILE "</TR>\n";
         print TABLEFILE "</TABLE>\n";
 
      }
 
 
   close (TABLEFILE);
 
}


#--------------------------------------------------------#
# SUB MAKE HTML OUTPUT FILE:
#
# Takes html code from table file and builds web page
# infrastructure around it.
#
sub makeoutfile {

   # read table file contents into an array.
   open (TABLEFILE, "$tablefile");
      # store contents of tablefile in array.
      @tablefilearray = <TABLEFILE>;
   close (TABLEFILE);


   # Define body style:
   $bgcolor = "black";
   $txtclr = "lime";
   $lnkclr = "lime";
   $vlnkclr = "lime";

   # define output topic file.
   $outfile = "$secdir/linklist_$topicname\_out.html";
   print "outfile = [$outfile]\n\n";
   $hold = <STDIN>;

   # open outfile for writing.
   open (OUT, ">$outfile");

      print OUT "<HTML>\n\n";
      print OUT "<HEAD>\n";
      print OUT "<TITLE>$topic_choice LINKS</TITLE>\n\n";

      print OUT "</HEAD>\n\n";

      print OUT "<BODY BGCOLOR = $bgcolor text = $txtclr link = $lnkclr vlink = $vlnkclr>\n\n";

      print OUT "<!-- HEADER TABLE -->\n\n";
      print OUT "<TABLE BORDER = 0><TR>\n";
      print OUT "   <TD WIDTH = 50></TD>\n";
      print OUT "   <TD WIDTH = 300 ALIGN = LEFT>\n";
      print OUT "   <FONT FACE = \"COMIC SANS MS\" SIZE = 5 COLOR = LIME>\n";
      print OUT "   <U>URL LINK LIST:</U></FONT></TD>\n";
      print OUT "   <TD ALIGN = LEFT>\n";
      print OUT "   <FONT FACE = TAHOMA SIZE = 6 COLOR = RED>\n";
      print OUT "   $topic_choice</TD>\n";
      print OUT "</TR></TABLE>\n\n";
      print OUT "<BR><BR><HR></HR><BR><BR>\n\n";


      print OUT "@tablefilearray\n\n";

      print OUT "</BODY>\n";
      print OUT "</HTML>\n\n";

   # close outfile.
   close (OUT);


}

