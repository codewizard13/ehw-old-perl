#!/usr/bin/perl
#
# Program:	openurlwperl.pl
# Creator:	Eric Hepperle
# Date:		09/17/01
#
# Purpose:	Not (entirely) my script.  (I modified it some).  Demonstrates how to use the "system" command to open a program (i.e.: browser).
#
#####################################################

use CGI;

$testfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/openurlwperl_test.html";

open (TEST, ">$testfile");

print TEST "<HTML>\n";
print TEST "Location: http://www.google.com/index.html\n\n";

system('start', "http://www.google.com");

print TEST "</HTML>\n\n";

close (TEST);

$page = 'http://www.yahoo.com';
$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
# system ("explorer $file");
system ("netscape $page");

print $query->redirect('http://www.google.com');
print "Just opened google...\n\n";

$hold = <STDIN>;
