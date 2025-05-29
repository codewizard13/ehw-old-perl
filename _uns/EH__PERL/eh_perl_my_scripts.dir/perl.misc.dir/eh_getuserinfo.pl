#!/usr/bin/perl

print "Content-type: text/plain", "\n\n";

$logfile = "c:/etc/eh_infolog_pc1.txt";

open (INFO_LOG, ">>$logfile");

   foreach $key (sort keys %ENV) {

      print $key, " = ", $ENV{$key}, "\n";

      print INFO_LOG $key, " = ", $ENV{$key}, "\n";

   }

close (INFO_LOG);


#exit (0);

$hold = <STDIN>;