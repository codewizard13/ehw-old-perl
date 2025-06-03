#!/usr/bin/perl
#
# Program:	crtsymsgpostsplit.pl
# Creator:	Eric Hepperle
# Date:		06/07/01
#
# Purpose:	This little script prints a courtesy message that can be copied
# and sent to user.  The advantage is that is sets automatically
# fills in the path names for you.
#
####################################################

print "\n";

print "Enter the name of the directory to split: \n";
$olddir = <STDIN>;
chomp $olddir;

$newvol = "$olddir\.old";
chomp $newvol;

print "\n";

print "The volume split has been completed. We split the volume at your public directory as discussed earlier. To begin, we named your public subdirectory to $olddir. Next, we created a new volume at $newvol making the new mount point. Using one of our tools, we then copied all the data in $olddir to $newvol. At this time, $newvol should be a carbon copy of $olddir. You can delete all the files in $olddir whenever you like.\n";

print "\n";



