#!/usr/bin/perl
# File searchhelpfuld.pl created by Eric Hepperle at 08:01:24 on Thu Sep  6 2001. 
#
# This little script searches a text file (in this case, the helful.d file) for any word the user enters and then displays every line containing that word.  Use a command line argument (i.e.: type the command and then a space and then the word you want to find.


if ($#ARGV < 0 || $ARGV[0] eq '-h') {
    print "Usage:  searchhelpfuld [-h]\n";
    exit;
}

$srchstr = $ARGV[0];

@found = `grep $srchstr /afs/rchland.ibm.com/usr2/csc/helpful.d`;

print "The result of your search for $srch is:\n\n";
print (@found);
