#!/usr/bin/perl -w
#
# Program:	checkbktimer.pl


use LWP::Simple;

while (1) {

   system("perl anoncheckbook.pl");
   sleep(60);

}


#--------------------------------------------------------
# BOOK CHECKER SUB:
#--------------------------------------------------------
#
sub anoncheckbook {

#########################################
# PRINT HEADER/DISCLAIMER:
#########################################
#

print "\n";
print "----------------------------------------\n";
print "This program gets the source code from the\n";
print "book site and stores to a designated folder.\n";
print "\n";


#########################################
# GET INPUT FROM USER:
#########################################
#

# initialize count.
$count = 1;

# get current date.
&time_mmddyy;

print "TODAY's DATE IS:  $mmddyy\n\n";

$miltime = "$hour:$min";
print "The CURRENT TIME is:\t$miltime\n\n";

#$hold = <STDIN>;


# set default url:
$url = "http://jump.uic.to/KBOOK";


# Tracing:
print "The requested url = \n";
print "$url\n";


# define maindir.
$maindir = "c:/windows/desktop/kbook_record.dir";

# define countfile.
$countfile = "$maindir/kcountfile.txt";

# check kbook count file for exist, if not, create and init.
unless (-e $countfile) {
   open (CNTFL, ">$countfile");
      $count = 1;
      print CNTFL $count;
   close (CNTFL);
}

# read count value.
open(CNTFL, "$countfile");
   $count = <CNTFL>;
close (CNTFL);

print "COUNT = $count\n\n";



# define web result name base part.
$docname = "kbook_rec_"."$count"."_$mmddyy.html";

print "THE DOCUMENT WILL BE CALLED:\n\n";
print "$docname\n\n";


# This is the line that retrieves the html code.
$file = get ($url);


# increment and close sound file.
$count++;

open (CNTFL, ">$countfile");
   print CNTFL $count;
close (CNTFL);


#########################################
# GET OLDFILE INFO:
#########################################
#


print "The url is: \n";
print "$url \n";
print "\n";

print "----------------------------------------\n";
print "\n";

print "The source code of the url is: \n";
print "\n";
print "----------------------------------------\n";
print "\n";
print "$file\n";

print "\n";


# Set HTML doc storage directory.
$destdir_main = "$maindir";

$webfile ="$destdir_main/$docname";

&getoldfile;

open (WEBDOC, ">$webfile") || die "cannot open input file $webfile \n";

   print WEBDOC "FILENAME: <FONT COLOR = \"#000099\"><B><U>$docname</U></B></FONT><BR>\n";
   print WEBDOC "This is the code I ripped from <B>$url<B>:<BR> \n";
   print WEBDOC "<HR></HR><BR>\n";

   # This is the line that writes the ripped html code to
   # the newly created html doc.
   #
   print WEBDOC $file;

close (WEBDOC);


&editindexlog;

#&compareoldtonew;

#---------


sub getoldfile {

   # whatever you want to name the newfile, that will
   # be the name of the oldfile to check for, as well.
   #
   $oldfile = $webfile;

   # if oldfile doesn't exist.
   if (! -e $oldfile) {

      print "The file $oldfile does not exist\n";
      #$hold = <STDIN>;

   } else {

      &compareoldtonew;


   }

}



# This sub works.
sub editindexlog {

   $indexlog = "$destdir_main/stored_webpage_index.html";

   if (! -e $indexlog) {

      open (INDEX, ">>$indexlog");

         print INDEX "<HTML>\n";
         print INDEX "<TABLE BORDER = 2>\n";
         print INDEX "<TR><TH FONT SIZE = 6 COLOR = RED ALIGN = CENTER WIDTH = 200>STORED PAGE NAME</TH>\n";
         print INDEX "<TH FONT SIZE = 6 COLOR = RED ALIGN = CENTER WIDTH = 500>ACTUAL URL</TH></TR>\n";
         print INDEX "</TABLE>\n";

     close (INDEX);

   }


   open (INDEX, ">>$indexlog");

      print INDEX "<HTML><HEAD><TITLE>STORED WEB PAGE INDEX\n";
      print INDEX "</TITLE></HEAD>\n";
      print INDEX "<BODY ALINK = BLUE VLINK = BLUE>\n";
      print INDEX "<TABLE BORDER = 2>\n";
      print INDEX "<TR>\n";
      print INDEX "<TD WIDTH = 200>$docname</TD>\n";
      print INDEX "<TD WIDTH = 500><A HREF = \"$url\" TARGET = TOP>$url </A></TD>\n";
      print INDEX "<TD WIDTH = 50>$miltime</TD>\n";
      print INDEX "</TR>\n";
      print INDEX "</TABLE>\n";
      print INDEX "</BODY></HTML>\n\n";

   close (INDEX);

}


sub compareoldtonew {

   # define file that holds any changes.
   $changelog = "$destdir_main/changelog.txt";

   open (CHANGELOG, ">$changelog");

      print "Just opened changelog file $changelog\n\n";

   close (NEWHTML);   

}


sub time_mmddyy {

 ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  localtime(time);
  $yyyymmdd = sprintf("%04d%02d%02d",$year+1900,$mon+1,$mday);
  $mmddyy = sprintf("%02d%02d%02d",$mon+1,$mday,$year%100);
  $miltime = sprintf("%02d:%02d", $hour, $min);
  print "The date in yyyymmdd format: $yyyymmdd\n";
  print "The date in mmddyy format:   $mmddyy\n";
  print "The time in military format is:	$miltime\n";
  

  }


#----------
#$hold = <STDIN>;

}