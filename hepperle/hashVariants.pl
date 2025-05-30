#!/usr/bin/perl
# File testhash.pl created by Eric Hepperle at 12:20:38 on Thu Jun  7 2001.
#
# Purpose:        Simple hash example.  Allows one to select one item from a 2 dimensional array.
#
#--------------------------------------------------
#
# Revisions:
#             06/07/03  - Added sorting formatting.
#                       - Renamed "hashVariants.pl"
#



$key = 101;


%hash1;

$hash1{100} = "This is some text";
$hash1{101} = "some more texts";
$hash1{105} = "even more!";

if ($hash1{$key})
{
    print $key = $hash1{$key} . "\n";
}

foreach ( %hash1 )
{
   print "$_\n";
}

print "\n\n";

#=========================================

foreach $line (keys %hash1) {
    my $color = $food_color{$food};
    print "$line is $hash1{$line}.\n";
}


foreach $line (sort { $hash1{$a} cmp $hash1{$b} }
                keys %hash1)
{
    print "$line is $hash1{$line}.\n";
}


#=========================================

print "\n\n";

foreach $line (sort { $hash1{$b} cmp $hash1{$a} }
                keys %hash1)
{
    print "$line is $hash1{$line}.\n";
}



#=========================================

print "\n\n";
print "SORTED NUMERICALLY (Descending)\n";

# sort by numerically (descending)
sub numDesc { $b <=> $a; }
@sortedNumDesc = sort numDesc 53,29,11,32,7;
$count = 1;
foreach $num (@sortedNumDesc)
{
   print "NUM $count = $num\n";
   $count++;
} # end foreach




#=========================================

print "\n\n";
print "SORTED NUMERICALLY (Ascending)\n";

# sort by numerically (ascending)
sub numAscend { $a <=> $b; }
@sortedNumAscend = sort numAscend 53,29,11,32,7;
$count = 1;
foreach $num (@sortedNumAscend)
{
   print "NUM $count = $num\n";
   $count++;
} # end foreach




#=========================================

print "\n\n";


# sort by length
@lines = sort { length($hash1{$a}) <=> length($hash1{$b}) }
    keys %hash1;

foreach $line (@lines) {
    print "$line is $hash1{$line}.\n";
}




foreach $line (sort keys %hash1) {
    print $line, '=', $hash1{$line}, "\n";
}



# get all environment variables
@keys = keys %ENV;
@values = values %ENV;
while (@keys) {
    print pop(@keys), '=', pop(@values), "\n";
}



$hold = <STDIN>;