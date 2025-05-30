#!/usr/bin/perl -w


my @months = qw (JUNK Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

for ($x = 0; $x <= $#months; $x++)

{

     print "Index[$x] = $months[$x]\n";

}

#----------
$hold = <STDIN>;
