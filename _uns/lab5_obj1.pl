#!/usr/bin/perl
use strict;
use warnings;

# Rudimentary column creation

#my $boss_first_name = "Penelope";
#my $boss_last_name = "Creighton-Ward"; #"Jones";
#my $butler_first_name = "Aloysius";
#my $butler_last_name = "Parker";

my $boss_first_name = '';
my $boss_last_name = '';
my $butler_first_name = '';
my $butler_last_name = '';

my $field_width = 15;

#####################
# GET NAMES:
print "Enter boss first name: ";
$boss_first_name = <STDIN>;
chomp($boss_first_name);
print "Boss First Name is $boss_first_name\n";

print "Enter boss last name: ";
$boss_last_name = <STDIN>;
chomp($boss_last_name);
print "Boss last Name is $boss_last_name\n";

print "Enter butler first name: ";
$butler_first_name = <STDIN>;
chomp($butler_first_name);
print "butler First Name is $butler_first_name\n";

print "Enter butler last name: ";
$butler_last_name = <STDIN>;
chomp($butler_last_name);
print "butler last Name is $butler_last_name\n";



###########################
# BOSS STUFF
my $bossNameFull = $boss_first_name . " " . $boss_last_name;
my $bossNameLength = length($bossNameFull);
my $bossNameRow1 = '';
my $bossNameRow2 = '';

if ( $bossNameLength > $field_width  )
{
  $bossNameRow1 = $boss_first_name;
  $bossNameRow2 = $boss_last_name;
  
}
else
{
  $bossNameRow1 = $bossNameFull;
  
}

my $bossNamePaddingRow1 = abs($field_width-length($bossNameRow1));
my $bossNamePaddingRow2 = abs($field_width-length($bossNameRow2));

# TRACING ...
print "Field Width: $field_width\n";
print "Boss First Name Length: " . length($boss_first_name) . "\n";
print "Boss Name Length: $bossNameLength\n";
print "Boss Name Full:   $bossNameFull\n\n";

###########################
# BUTLER STUFF
my $butlerNameFull = $butler_first_name . " " . $butler_last_name;
my $butlerNameLength = length($butlerNameFull);
my $butlerNameRow1 = '';
my $butlerNameRow2 = '';

if ( $butlerNameLength > $field_width  )
{
  $butlerNameRow1 = $butler_first_name;
  $butlerNameRow2 = $butler_last_name;
  
}
else
{
  $butlerNameRow1 = $butlerNameFull;
  
}

my $butlerNamePaddingRow1 = abs($field_width-length($butlerNameRow1));
my $butlerNamePaddingRow2 = abs($field_width-length($butlerNameRow2));


#print out a line containing the boss's first and last names in the first field and the butler's first and last names in the second field.
#
#If a full name does not fit in a field, print out the first name only and then print the last name on the next line.
#
#The names should be left-justified in the fields.
#
#The output with the above settings should look like:
#
#|               |               |
#|Penelope       |Aloysius Parker|
#|Creighton-Ward |               |

my $bossNameNumSpaces = abs(($field_width-$bossNameLength));
print "\$bossNameNumSpaces = abs($field_width - $bossNameLength) = $bossNameNumSpaces\n\n";

print "|", " "x$field_width, "|", " "x$field_width, "|\n";
print "|", $bossNameRow1, " " x $bossNamePaddingRow1, "|", $butlerNameRow1, " " x $butlerNamePaddingRow1, "|\n";
print "|", $bossNameRow2, " " x $bossNamePaddingRow2, "|", $butlerNameRow2, " " x $butlerNamePaddingRow2, "|\n";

print "\n\n";
my $lc_name1 = lc($boss_last_name);
my $lc_name2 = lc($butler_last_name);
my $nameResult;

if ( $lc_name1 eq $lc_name2 )
{
  $nameResult = "Their last names match ... they might be related"; 
}
else
{
  $nameResult = "Their last names don't match ... probably not relatives";
}

my $bossLNameCap = "\L\u$boss_last_name";
my $butlerLNameCap ="\L\u$butler_last_name";
print "Boss's last name is   " . $bossLNameCap . " and\n";
print "Butler's last name is " . $butlerLNameCap . "\n";
print "$nameResult\n";