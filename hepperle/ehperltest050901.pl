#!/usr/bin/perl
##################



<html>
<!-- CREATED BY: Eric Hepperle -->
<body>

<script language="PerlScript">

$window->document->write("Hello world!");


#----------------------------------------

#get the current hit count from the
# counter file.
open(FILE, "C:\ehperl\eh_hitcounter.txt");
    $visits = <FILE>;
close(FILE);

# Incriment the hit count by 1
$visits++;

# Overwrite the old number with the new
# number which is 1 higher.
open(FILE, ">counter.txt");
    print FILE $visits;
close(FILE);



#-------------------------------------------




print "Hello Cyberspace\n\n"






$INET->OpenURL($URL, "http://www.yahoo.com/");
 $bytes = $URL->QueryDataAvailable();
 $file = $URL->ReadEntireFile();
 $URL->Close();