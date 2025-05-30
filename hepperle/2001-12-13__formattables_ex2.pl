#!/usr/bin/perl
#
#
# Program:	formattables_ex2.pl
# Creator:	Eric Hepperle
# Date:	12/14/01
#
# Purpose:	Simple example of how to use the format command to define fixed character widths in columnar tables for printing. The first one didn't work. Second attempt.
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
#
#
#


#------------------------------------------------------|
### BEGIN NEW ###

$| = 1;

@passwdfile = `cat /etc/passwd`;
#print "DEBUG:\n", @passwdfile, "\n";




foreach $line (@passwdfile) {

#print 'line: ', $line;
   @spasswd = split (/:/, $line);
#   print "spasswd: $#spasswd\n";

   $afsid = $spasswd[0];
   $fullname = $spasswd[4];

#   print "afsid = $afsid\n";
#  print "full name = $fullname\n\n";


  $~ = REPORT;

   write;
#    printf "%-10s  %s\n", $afsid, $fullname;

}


   format REPORT =
   @<<<<<<<<     @<<<<<<<<<<<<<<<<
   $afsid,              $fullname
.



__END__

###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called formattables_ex2.pl\n\n";


$lamb = "fattest";
$bla = "Mary had a little lamb and it was the ";

select(STDOUT);
$~ = MARK;

write;

format MARK =
Mary had a little lamb and it was the @<<<<<<<<<<
                                       $lamb
.

### END ###

   
