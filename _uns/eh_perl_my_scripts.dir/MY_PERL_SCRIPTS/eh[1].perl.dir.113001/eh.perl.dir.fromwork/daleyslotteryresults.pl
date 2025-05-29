#!/usr/bin/perl
# File daleyslotteryresults.pl created by Eric Hepperle at 11:38:52 on Mon Jun 11 2001. 

# getloto.perl
# get UK lottery result and reformat

use LWP::Simple;
use HTML::Parse;

$debug = 1;

$doc = parse_html(get 'http://www.connect.org.uk/lottery/')->format;
print STDERR $doc if $debug;

@lines = split(/^/, $doc);              # split into an array of lines

for ($i=0; $i < $#lines; $i++) {    
    if ($lines[$i] =~ /^ *Winning.*\((.*)\).*/) {
        $when = $1;                                     # find date of draw
        $when =~ s/\w+ (\d+)\w+ (\w+) (\d+)/$1 $2 $3/;  # reformat date

        $draw = $lines[++$i];                           # result on next line
        chop($draw);
        $draw =~ s/.*\[(.*)\].*/$1/;                    # extract numbers

        last;                                           # don't need any more
    }
}

@months = ("January", "Feburary", "March", "April", "May", "June", "July", 
            "August", "September", "October", "November", "December");
@lt = localtime(time());
$today = $lt[3] . " " . $months[$lt[4]] . " " . ($lt[5]+1900);

if ($today eq $when) {
    print "Today's Lottery result. $when - $draw\n";
}
else {
    print "Last Lottery result. $when - $draw\n";
}

