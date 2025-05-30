#!/usr/bin/perl
# File eh_myhtmlgen1.pl created by Eric Hepperle at 08:37:57 on Fri Aug 17 2001.
#
# Program:	ehdailylog_100306.pl
#		(formerly known as:
#		eh_createtblnapndcells_new_1.1.pl)
# Creator:	Eric Hepperle
# Date:		09/06/01
#
# Purpose:	Lets user maintain a daily log of activities and is very
#		versatile.  It can can be used as a guestbook, a bulletin
#		board, etc...
#
#		NOTE:  This version is a MILESTONE.
#
########################################################
#
# Revisions:
#
#	08/22/01
#	  - R1. This is code borrowed from
#	    my original script I created 08/21/01.
#	  - Added style tags.
#	  - Put a space after the "Time" prompt.
#	  - Set bgcolor permanent.
#	  - Added preformatting tags. (it didn't help)
#	  - Implemented date subroutine to grab convert
#	    date to MMDDYY format.
#	  - Utilized the mmddyy variable to create a
#	    filename referencing the date.
#
#	08/23/01
#	  - Adjusted some font properties
#
#	08/27/01
#	  - Created new variables to display the date
#	    in the web page title.
#
#	09/05/01
#	  -
#
#	09/06/01
#	  - Major code overhaul.
#
#	09/07/01
#	  - EUREEKA!! --> I have solved two problems
#	    with one stone: I made one table with
#	    individual cells and I figured out how
#	    how to print the web page in the correct
#	    format.
#
#	    Now, I can actually reuse the formatting
#	    subroutine in my printing "df-k" results
#	    acgi test prog.!
#
#	09/13/01
#	  - Renamed the script from
#	    eh_createtblnapndcells_new_1.1.pl to
#	    "ehdailylog.pl"; easier to remember.
#
#	  - Adjusted my script to create a new cumlog
#	    every day that the logging script is run.
#
#########################################################
#
# Planned Improvements:
#
# *  Make a versions and variations list.
# *  Make a version where the log is one whole table.
#	DONE.
# *  Eventually make this a CGI.
# *  Figure out how to read the stored array of event
#    into the table, and have it print wysiwyg style.
#	DONE.
# *  Adjust script to place cumlogs in storage folder.
#    This should facilitate the use of this script as
#    a basis for keeping a guestbook, and it should
#    allow easy retrieval of archived logs.
#
#########################################################


#--------------------------------------------------------
# Create and Establish Temporal Variables:
#
&time_mmddyy;
print "\n";


# define the 'current system time' variable:
$scalartime = localtime(time);


# Show today's date:
print "Today's date = \$mm\$dd\$yy = $mm/$dd/$yy\n";


#********************************************************
# INITIALIZE GLOBAL VARIABLES:
#********************************************************

#$maindir = "/afs/rchland.ibm.com/usr3/v2cib484/tmp";
#PC VERSION:  "file:///C:/Windows/Desktop/tmp.dir"

# (suggested modification 10/03/06) grab user directory using windows
# environment vars.

# modified to facilitate program operation 10/03/06
$maindir = "C:/Documents and Settings/hepperle/DAILY LOGS";

$docname = "html_test_doc.html";

$titletext = "EH DAILY LOG:  $mm/$dd/$yy\n";

$bgc = "#748D4B"; # background color

#********************************************************
# DISCLAIMER/HEADER:
#********************************************************

print "\n";
print "This program will allow you to enter an updated list of\n";
print "events and to keep a log of your day.\n";
print "\n";
print "\n";


#*********************************************************
# DEFINE COMPONENT FILES:
#*********************************************************

#-------------------------------
# Define Event Plain Text File:
#
$eventplain_file = "$maindir/eventplain.tmp";


#-------------------------------
# Define Event Converted File:
#
$eventcnvrtd_file = "$maindir/eventconverted.tmp";


#-------------------------------
# Define This Cell File:
#
$thiscell_file = "$maindir/thiscell.tmp";


#-------------------------------
# Define Cumulative Cell File
#
$cumcell_file = "$maindir/cumcell.$mmddyy.tmp";


#--------------------------------
# Define HTML w/ Table File:
#
$htmlwtable_file = "$maindir/tablefile.tmp";


#*********************************************************
# GET INPUT FROM USER:
#*********************************************************

&getinput;


#*********************************************************
# FORMAT AND CREATE LOG TABLE COMPONENTS:
#*********************************************************

print "TESTING:\n--------------\n";
print "\n";

&create_eventplain;

# TRACING:
print "The eventplain file should have just been created\n";
print "and should contain the following:\n\n";
print (@event_text),"\n\n";

&convnl2brtag;

&create_thiscell;

&appendcell2cumfile;


#*********************************************************
# FORMAT & CREATE MAIN WEB PAGE:
#*********************************************************

&create_htmllog;


#*********************************************************
# VERIFY:
#*********************************************************

print "Press Enter to Continue:\n";
$hold = <STDIN>;
print "\n";

print @event_text;
print "\n";
print "\n";
print "The End!\n";


#***********************************************************
# SUBROUTINES:
#***********************************************************

sub printfile2scrn2vrfy {

        open (IN, $cumcell_file) || die "Cannot open $cumcell_file for read :$!";

           while (<IN>) {

           print;

           }

        close IN;
}


# Create new cell w/ converted entry text, and
# establish row tags, etc...
#
sub create_thiscell {

open (CNVRTD, "$eventcnvrtd_file");

# read converted file into an array.
@converted = <CNVRTD>;

   open (THISCELL, ">$thiscell_file") || die "cannot open specified file $thiscell_file \n";

   print THISCELL "<!--BEGIN ROW------------>\n";
   print THISCELL "\n";
   print THISCELL "<TR>\n";
   print THISCELL "\n";
   print THISCELL "   <TD WIDTH = 70 VALIGN = TOP><H6 CLASS = \"time\">$event_time</H6>\n";
   print THISCELL "   </TD>\n";
   print THISCELL "\n";
   print THISCELL "   <TD WIDTH = 450 VALIGN = TOP>";
   print THISCELL "<P><H6 CLASS = \"tndstamp\">$scalartime</H6></P>";
   print THISCELL "\n";
   print THISCELL "<FONT SIZE = 2 CLASS = \"regular\">@converted</FONT>";
   print THISCELL "\n";
   print THISCELL "   </TD>\n";
   print THISCELL "\n";
   print THISCELL "</TR>\n";
   print THISCELL "\n";

close (THISCELL);

close (CNVRTD);


}


sub appendcell2cumfile {

# if thiscell file doesn't open, give error msg.
open (THISCELL, "$thiscell_file") || die ("cannot open input file $thiscell_file \n");

   # if cumcell file can't open for appending,
   # give error msg.
   open (CUMCELL, ">>$cumcell_file")|| die ("cannot open output file $cumcell_file \n");

   # define an array var to hold contents of
   # thiscell_file
   #
   @thiscell = <THISCELL>;

   # append the contents of @thiscell to cumcell_file
   print CUMCELL @thiscell;

   # define an array var to hold contents of
   # cumcell_file
   #

   # close the cumcell_file.
   close (CUMCELL);

# close thiscell_file.
close (THISCELL);

}


sub time_mmddyy {

 ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
  $yyyymmdd = sprintf("%04d%02d%02d",$year+1900,$mon+1,$mday);
  $mmddyy = sprintf("%02d%02d%02d",$mon+1,$mday,$year%100);
  #
  # define Month number variable.
  $mm = sprintf("%02d",$mon+1);
  #
  # define Day-of-month variable.
  $dd = sprintf("%02d", $mday);
  #
  # define Year, 2-digit.
  $yy = sprintf("%02d", $year%100);
  #
  print "The date in yyyymmdd format: $yyyymmdd\n";
  print "The date in mmddyy format:   $mmddyy\n";

}


sub defaults_main {

$maindir = "/afs/rchland.ibm.com/usr3/v2cib484/tmp";
#PC VERSION:  "file:///C:/Windows/Desktop/tmp.dir"
#
$docname = "html_test_doc.html";
#
$webfile = "$maindir/$docname";
#
$titletext = "This is a test web page generated by my perlscript webpage creator";
#
$titletext = "EH DAILY LOG:  $mm/$dd/$yy\n";
#
$bgc = "lightskyblue";
#
$bodycontent = "AIX IS AWESOME!!!";

}


sub getinput {

#---------------------------------
# Get event time:
#
print "Time: ";
$event_time = <STDIN>;
chomp $event_time;

# Announce the time to user.
print "The time will be logged as $event_time.";
print "\n";


#---------------------------------
# Get event text:
#
print "Enter what happened:\n";
print "(Press <ctrl + d> when done)\n";
@event_text = <STDIN>;
#chomp @event_text;
print "\n";


#-----------------------------------------------
# Lucas Schroeder said I could try to search and
# replace newline characters and replace them
# with the break <br> html tag.  We just found out
# it doesn't work w/ @ variables.  boo-hoo!
#
#substr($event_text, 0) =~ s/\n/<BR>/g;
#


print "Here is what you just typed:\n";
print "----------------------------------------\n\n";
print @event_text;
print "\n";
print "----------------------------------------\n";

}


# holding place for the contents of @event_text.
sub create_eventplain {

open (EVENTPLN, ">$eventplain_file");

   print EVENTPLN (@event_text);

close (EVENTPLN);

}


sub convnl2brtag {

open (EVENTPLN, "$eventplain_file");

open (CNVRTD, ">$eventcnvrtd_file");

   @eventplain = <EVENTPLN>;

   $count = 1;

   foreach $line (@eventplain){

      print "line $count:	$line\n";

      $wonl = $line;

      substr($wonl, 0) =~ s/\n/<BR>/g;

      print "converted $count:	$wonl\n";
      print CNVRTD "$wonl\n";

      $count++;

   }


close (CNVRTD);

close (EVENTPLN);

}


sub create_htmllog {

$docname = "eh_dailylog_$mmddyy.html";

print "\n";
print "The webpage created will be called: $docname";
print "\n\n";

$webfile = "$maindir/$docname";

open (CUMCELL, "$cumcell_file");

   # read cumcell_file to array for processing.
   @cumcell = <CUMCELL>;

close (CUMCELL);

# set the body content array = @cumcell.  This
# will facilitate future modification if more than
# what we currently are using is desired in the body
# of the table.
#
@bodycontent = @cumcell;

open (HTML_DOC, ">$webfile") || die "cannot open output file $webfile \n";

print HTML_DOC "<HTML>\n";
print HTML_DOC "\n";
print HTML_DOC "<HEAD>\n";
print HTML_DOC "\n";
print HTML_DOC "<TITLE>\n";
print HTML_DOC "$titletext\n";
print HTML_DOC "</TITLE>\n";
print HTML_DOC "\n";
print HTML_DOC "</HEAD>\n";
print HTML_DOC "\n";
print HTML_DOC "<STYLE>\n";
print HTML_DOC "\n";

# This is where I began modifying color schemes ...
print HTML_DOC "\.time \{font-family:  \"Gill Sans\", \"Tahoma\", \"Arial\"\; font-size: 10pt\; color: black\}\n";
print HTML_DOC "\.tiny \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 4pt\; color: #EDEDFF\}\n";
print HTML_DOC "\.tinyp1 \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 5pt\; color: white\}\n";
print HTML_DOC "\.tndstamp \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 10pt\; color: #F5F01B\}\n";
print HTML_DOC "\.regular \{ font-family:  \"Tahoma\",\"Arial\"\; font-size: 9.5pt\; color: beige\}\n";
# End color scheme modifications.

print HTML_DOC "\n";
print HTML_DOC "</STYLE>\n";
print HTML_DOC "\n";
print HTML_DOC "<BODY BGCOLOR = $bgc>\n";
print HTML_DOC "\n";
print HTML_DOC "<TABLE BORDER = 1>\n";
print HTML_DOC "\n";
print HTML_DOC @bodycontent;
print HTML_DOC "\n";
print HTML_DOC "</TABLE>\n";
print HTML_DOC "\n";
print HTML_DOC "</BODY>\n";
print HTML_DOC "\n";
print HTML_DOC "</HTML>\n";
print HTML_DOC "\n";

# *** ORIGINAL COLOR SCHEME ***
# print HTML_DOC "\.time \{font-family:  \"Gill Sans\", \"Tahoma\", \"Arial\"\; font-size: 10pt\; color: red\}\n";
# print HTML_DOC "\.tiny \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 4pt\; color: lightslateblue\}\n";
# print HTML_DOC "\.tinyp1 \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 5pt\; color: lightslateblue\}\n";
# print HTML_DOC "\.tndstamp \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 10pt\; color: lightslateblue\}\n";
# print HTML_DOC "\.regular \{ font-family:  \"Tahoma\",\"Arial\"\; font-size: 9.5pt\; color: black\}\n";

close (HTML_DOC);

}