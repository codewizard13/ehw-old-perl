#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

print "Content-type: text/html\n\n";
print "<html><h1>Hello!</h1></html>\n\n\n";

my $bar = "-"x70 . "\n\n";

#################################

# my $fsutil = `fsutil fsinfo drives`;
#
# print "Printing \$fsutil: $fsutil\n\n";
#
# my ($junk, $drives) = split(/: /, $fsutil);
#
# $drives =~ s/\0//g; # remove all null characters
# #$drives =~ s/\\//g; # remove all backslashes
# $drives =~ s/\s//g; # remove all whitespace
#
# my @testArr = $drives =~ m#([a-zA-Z]:)\\#g;

printArray(fsutil());


#----------- SUBROUTINES ------------#

# Description: (Windows only) Gets a list of all drives on the system
#   by running the DOS fsutil command.
# @returns: ARRAY list of all drives
sub fsutil {
    my $fsutil = `fsutil fsinfo drives`;

    print "Printing \$fsutil: $fsutil\n\n";

    my ($junk, $drives) = split(/: /, $fsutil);

    $drives =~ s/\0//g; # remove all null characters
    $drives =~ s/\s//g; # remove all whitespace

    my @testArr = $drives =~ m#([a-zA-Z]:)\\#g;

    return @testArr;
}

sub printArray {
  my $hr = "-"x74 . "\n\n";

  my @array = @_;

  print "$hr";
  print "PRINTED BY " . __FILE__ . "\n\n";

  foreach my $el (@array) {
    print "$el\n";
  }
  print "\nARRAY LENGTH = " . scalar(@array) . "\n";
  print $hr;
}