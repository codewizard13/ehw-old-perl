#!/usr/bin/perl

use strict;
use warnings;

use Cwd;
use Data::Dumper;

use MSDOS::Attrib qw(get_attribs set_attribs);
use File::Spec::Win32;


print "\nHello Worldz!\n\n\n";

pause();

#
# test MSDOS::Attrib
#

# define test folder path
my $test_path = q{C:\Documents and Settings\nunya\My Documents\Downloads\TEST_DIR\atrrib_test_1};
# tracing ...
print '$test_path: ', Dumper($test_path), "\n\n";
pause();

my ($volume,$directories,$file) = File::Spec::Win32->splitpath( $test_path );

# get current attribs of folder
my $attribs = get_attribs($test_path);
# tracing ...
print "ATTRIBUTES OF \$test_path:", Dumper($attribs), "\n\n";pause();

# store attribs in a hash
#my @attrib_vals = split('',$attribs);
# tracing ...
#print "ATTRIBUTES (ARRAY) OF \$test_path:", Dumper(@attrib_vals), "\n\n";pause();

# test map function as it looks promising for making an array to reference
#  these attrib postitions
#my %attribs = map { $_ => $_ } @user_objects;

attrib_hash($attribs);

# input: string $attrib_str string of 5 attrib chars
sub attrib_hash {
   my ($attrib_str) = @_;

   my $attribs_hr = {};

   my @attrib_vals = split('',$attrib_str);
#   foreach my $c (@attrib_vals) { print "$c\n"; }

   print "\$attrib_str = $attrib_str\n\n"; pause();
   print "\@attrib_vals = ", Dumper(@attrib_vals), "\n\n"; pause();
   print "\%attribs = ", Dumper(%{$attribs_hr}), "\n\n"; pause();

   $attribs_hr->{'pos_R'} = $attrib_vals[0];
   $attribs_hr->{'pos_H'} = $attrib_vals[1];
   $attribs_hr->{'pos_S'} = $attrib_vals[2];
   print "\%attribs = ", Dumper(%{$attribs_hr}), "\n\n"; pause();

   print "\$#attrib_vals = ",$#attrib_vals,"\n\n";

# #   for my $i (0 .. $#attrib_vals) {
#     for (my $i=0; $i<=$#attrib_vals; $i++) {
#
#       print "COUNT = $i:  \$attrib_vals[$i] = $attrib_vals[$i]\n";
#
#       $attribs->[pos_R] =
#
#    }
   return $attribs_hr;
}



# ------- SUBROUTINES ------- #

sub pause {
   <STDIN>;
   print "... PRESS A KEY TO PROCEED ...\n\n";
   return 1;
}
