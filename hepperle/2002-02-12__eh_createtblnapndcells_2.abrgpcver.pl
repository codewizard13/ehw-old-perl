#!/usr/bin/perl
# File eh_myhtmlgen1.pl created by Eric Hepperle at 08:37:57 on Fri Aug 17 2001.
# Program:     eh_createtblnapndcells_2.pl
# Creator:     Eric Hepperle Date:        08/22/01
#########################################################

&time_mmddyy;
print "\n";

#********************************************************
# DEFAULTS:
#********************************************************
$maindir = "c:/windows/desktop";
$docname = "html_test_doc.html";
$titletext = "EH DAILY LOG:  $dd/$mm/$yy\n";
$bgc = "lightskyblue";

open (MAINFILE, ">>file:///C:/windows/desktop/mainfile.txt");

   print MAINFILE "This is a test: thank you!";

close (MAINFILE);

#********************************************************
# DISCLAIMER/HEADER:
#********************************************************
#
print "\n";
print "This program will allow you to enter an updated list of\n";
print "events and to keep a log of your day.\n";
print "\n";

#*********************************************************
# GET INPUT FROM USER:
#*********************************************************
#-------------------------------
# Define Cumulative Cell File:
#
$templogfile = "$maindir/logfile.tmp.txt";

#---------------------------------
# Get event time:
print "Time: ";
$event_time = <STDIN>;
chomp $event_time;

print "The time will be logged as $event_time.";
print "\n";

# Get event text:
print "Enter what happened:\n";
print "(Press <ctrl + d> when done)\n";
@event_text = <STDIN>;
chomp @event_text;
print "\n";

print "Here is what you just typed:\n";
print @event_text;
print "\n";

#@event_text = "This is the event text for testing purposes.  Perl rocks!!";
#*********************************************************
# FORMAT TABLE:
#*********************************************************

#----------------------------------
# Create New Cell, Do Variable
# substitution, and write to file.
#
$scalartime = localtime(time);

&create_cell;
print "\n";

# initialize file.
open (OUT, ">>$templogfile");

   print OUT "\n";

close (OUT);


&printfile;

open OUT, ">>$templogfile" or die "Cannot open $templogfile for append : $!";

print "\n";
print "The following is the contents of \$scalartime: \n";
print $scalartime;
print "\n";

close OUT;

&printfile;


#*********************************************************
# FORMAT & CREATE MAIN WEB PAGE:
#*********************************************************
#

$docname = "eh_dailylog_$mmddyy.html";

print "\n";
print "The webpage created will be called: $docname";
print "\n";

$webfile = "$maindir/$docname";


&rdfilen2array;

open (HTML_DOC, ">>$webfile") || die "cannot open output file $webfile \n";

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
print HTML_DOC "\.time \{font-family:  \"Gill Sans\", \"Tahoma\", \"Arial\"\; font-size: 10pt\; color: red\}\n";
print HTML_DOC "\.date \{ font-family:  \"Tahoma\",\"Gill Sans\",\"Arial\"\; font-size: 12pt\; color: navy\}\n";
print HTML_DOC "\n";
print HTML_DOC "</STYLE>\n";
print HTML_DOC "\n";
print HTML_DOC "<BODY BGCOLOR = $bgc>\n";
print HTML_DOC "\n";
print HTML_DOC "<TABLE BORDER = 2>\n";
print HTML_DOC "\n";
print HTML_DOC @bodycontent;
print HTML_DOC "\n";
print HTML_DOC "</TABLE>\n";
print HTML_DOC "\n";
print HTML_DOC "</BODY>\n";
print HTML_DOC "\n";
print HTML_DOC "</HTML>\n";
print HTML_DOC "\n";


close (HTML_DOC);


#*********************************************************
# VERIFY:
#*********************************************************
#

print "Press Enter to Continue:\n";
$hold = <STDIN>;


print "\n";

print "\n";
print "\n";
print "\n";

print @event_text;
print "\n";
print "\n";
print "The End!\n";



#***********************************************************
# SUBROUTINES:
#***********************************************************

sub printfile {

        open (IN, $templogfile) || die "Cannot open $templogfile for read :$!";

           while (<IN>) {

           print;

           }

        close IN;
}



sub create_cell {

   open (TEMPLOG, ">$templogfile") || die "cannot open specified file
$templogfile \n";

   print TEMPLOG "<!--BEGIN ROW------------>\n";
   print TEMPLOG "\n";
   print TEMPLOG "<TR>\n";
   print TEMPLOG "\n";
   print TEMPLOG "   <TD WIDTH = 70 VALIGN = TOP><H6 CLASS = \"time\">$event_time</H6>\n";
   print TEMPLOG "   </TD>\n";
   print TEMPLOG "\n";
   print TEMPLOG "   <TD WIDTH = 450 VALIGN = TOP>";
   print TEMPLOG "<H5 CLASS = \"date\">$scalartime</H5>";
   print TEMPLOG "\n";
   print TEMPLOG @event_text;
   print TEMPLOG "\n";
   print TEMPLOG "   </TD>\n";
   print TEMPLOG "\n";
   print TEMPLOG "</TR>\n";
   print TEMPLOG "\n";

close (TEMPLOG);

}


sub rdfilen2array {

   unless (open (CUMFILE, "$templogfile") ) {

      die ("cannot open input file $templogfile \n");

   }

   @bodycontent = <CUMFILE>;

   print (@bodycontent);

}


sub time_mmddyy {

 ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  localtime(time);
  $yyyymmdd = sprintf("%04d%02d%02d",$year+1900,$mon+1,$mday);
  $mmddyy = sprintf("%02d%02d%02d",$mon+1,$mday,$year%100);
  print "The date in yyyymmdd format: $yyyymmdd\n";
  print "The date in mmddyy format:   $mmddyy\n";

  }
#----------
$hold = <STDIN>;
