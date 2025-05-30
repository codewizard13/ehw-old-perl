#!/usr/bin/perl
#
#
# Program:	rename2
# Creator:	Eric Hepperle
# Date:	12/28/01
#
# Purpose:	Not my script.  Taken from : http://www.evolt.org/article/Renaming_Files_with_Perl/17/351/
#
###################################################
#
# Revisions:
#
#	- Original:  12/28/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called rename2\n\n";

#####################################################
#
# Usage: rename perlexpr [files]
#
# EXAMPLES:
#
# 1.Make all the files in the directory end with .html instead of .txt.
#
#                     rename 's/txt$/html/' *
#
# 2.Change all the files prefixed with the text mah and suffixed with .new
#   to be suffixed with .old instead.
#
#                     rename 's/new$/old/' mah*.new
#
# 3.Hide every file in the directory by prefixing the filename with a .
#
#                     rename 's/(.+)/\.$1/' *
#
#####################################################



($regexp = shift @ARGV) || die "Usage:  rename perlexpr [filenames]\n";

if (!@ARGV) {
   @ARGV = <STDIN>;
   chomp(@ARGV);
}


foreach $_ (@ARGV) {
   $old_name = $_;
   eval $regexp;
   die $@ if $@;
   rename($old_name, $_) unless $old_name eq $_;
}

exit(0);

