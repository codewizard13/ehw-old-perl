#!/afs/rchland.ibm.com/usr3/v2cib484/dce/perl5/bin
#/usr/bin/perl
#
# Program:	daleyslotteryresults.pl
# Creator:	Eric Hepperle
# Date:		06/11/01
#
# Purpose:	Not my script.  original filenmae = getloto.perl.  Gets UK lottery result from a given url.
#
#####################################################


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

