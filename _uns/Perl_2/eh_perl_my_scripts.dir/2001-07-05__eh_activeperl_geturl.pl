#!/usr/bin/perl -w

use LWP::Simple;


print "Enter url to retrieve: ";
$url = <STDIN>;


 $content = get("$url";)

 if (mirror("$url";, "foo") == RC_NOT_MODIFIED) {

     print "The url RC_NOT_MODIFIED, but don't know what that means\n";

 }

 if (is_success(getprint("$url";))) {

     print "The operation was a success!\n";

 }


print "Hit any key to continue: ";


$hold = <STDIN>;