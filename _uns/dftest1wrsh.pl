#!/usr/bin/perl
#
# Program:	dftest1wrsh.acgi
# Creator:	Eric Hepperle
# Date:		08/24/01
#
# Purpose:	Test script to help me write a
#		script to display system info in
#		real-time on a cgi page.
#
##################################################
#
# Revisions:
#
#	08/24/01
#	  - Original.
#
#	09/13/01
#	  - Added conversion routine that replaces
#	    newlines w/ <br> tag.
#	  - It still won't print spaced properly, so
#	    I have also added a subroutine to split
#	    the array at spaces.
#	  - Derived a regular (non-cgi) perl version.
#	  - Relized there is no purpose to have a
#	    regular version.
#
##################################################
#
# Notes:
#	* The "acgi" extension creates a
#	  secure cgi file and is used in
#	  conjunction w/ secure web pages.
#
#	* It works!!!
#
##################################################
#
# Planned Improvements:
#
#	* Make the lines display correctly in page.
#	  probably need a foreach loop to do it
#	  right.
#
#	* Make the elements into an array.
##################################################
#
# 
#

$cur_host = "doomsday.rchland.ibm.com";
$dfk_rsh = `rsh $cur_host df -k`;
$dfkconv = $dfk_rsh;

#-----------------

print "\n\n";
print "\n\n";
print "dftest1wrsh.acgi\n";
print "\n\n";
print "\n\n";
print "\n";
print "GOODBYE, World!\n";
print "\n";

print "$cur_host = \"doomsday.rchland.ibm.com\"\n";

print "\n";
print "\$dfk = \`df -k\`\n";

print "rsh \$cur_host \$dfk\n";
print "\n";

print "rsh $cur_host $dfk";
print "\n";

print "$dfk_rsh";

print "\n";
print "#----------------------------#\n";

&convnl2br;
# convert and replace newline chars w/ br tag

print "$dfkconv\n";
print "\n";

print "\n";
print "#----------------------------#\n";

&convnl2br;
# convert and replace newline chars w/ br tag

&mkarray;
# make array for formatting:

print "\n";
print "#----------------------------#\n";

#&mkhash;
# make hash for formatting:

print "\n";
print "#----------------------------#\n";

print "\n\n";
print "\n";
print "\n";


sub mkarray {

$x = 1;

$line = $dfkconv;

print "\$x = $x\n\n";

# split the list at each space.
@list = split (/ /, $line);

print "\@list$x =\n\n";
print "@list";

}


sub convnl2br {

# convert and replace all newline chars in the var
# with <br>.
substr($dfkconv, 0) =~ s/\n/<BR>/g;

}


sub countarray_elements {}

sub mkhash {

my $count = 1;

   foreach $element (@list){

      $hash{$count} = $element;

      print "element # $count = $hash{$count}\n";

      $count++;   


   }

}
