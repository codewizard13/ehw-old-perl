#!/usr/bin/perl
#
#
# Program:	func_getipcfg.pl
# Creator:	Eric Hepperle
# Date:		01/16/02
#
# Purpose:	Greps first 3 parts of octet against /etc/network.config file and returns config info.
#
###################################################
#
# Revisions:
#
#	- Original:  01/16/02
#
#	01/16/02 - WORKS GREAT!!  Save 2 extra steps =
#		   1/3 the time.
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called func_getipcfg.pl\n\n";





# set ARGV[0] value:
if ($ARGV[0] ne "") {


   $clientip = $ARGV[0];
   chomp $clientip;


   # if argument contains an alpha char, then is a hostname.
   if ($ARGV[0] =~ /[aA-zZ]/) {

      print "The argument is a hostname.\n\n";

      # interpolate tcpip add from hostname.
      $hostcmdoutput = `host $ARGV[0]`;

      # Tracing:
 #     print "\$hostcmdoutput = $hostcmdoutput\n";

      # split hostcmdoutput string at " is " (spaces included)
      @sphostoutp = split(/ is /, $hostcmdoutput);

      # Tracing:
  #    print "\@sphostoutp = @sphostoutp\n\n";
     
      $clientip = $sphostoutp[1];
      $hostn = $sphostoutp[0];

      # Tracing:
   #   print "\$hostn = $hostn\n\n";

      chomp $clientip;

      # Tracing:
    #  print "\$clientip = $clientip\n\n";


   } else {

      print "The argument is a TCP\/IP address.\n\n";

      # run "host" command
      $hostcmdoutput = `host $ARGV[0]`;

      # split hostcmdoutput string at " is " (spaces included)
      @sphostoutp = split(/ is /, $hostcmdoutput);

      # Tracing:
#      print "\@sphostoutp = @sphostoutp\n\n";

      $hostn = $sphostoutp[0];

   }



   # Tracing:
   #print "\$clientip = $clientip\n\n";

   # Split the ip address at periods.
   @spcip = split(/\./, $clientip);

   # Tracing:
   #print "\@spcip = @spcip\n\n";

   $threeoctets = "$spcip[0].$spcip[1].$spcip[2]";

   # Tracing:
#   print "\$threeoctets = $threeoctets\n\n";

   # actually get the config info now:
   @grepip = `grep $threeoctets /etc/network.config`;

   # if a line in the grepip array contains "$threeoctets " (space incl.), then...
   #foreach $line (@grepip) {

   # Tracing:
   #print "\$line =\n";
   #print "$line\n\n";

   #   if ($line =~ /$threeoctets /g) {

         # Tracing:
   #      print "\$line contains \"$threeoctets \".\n";
   #      print "THE LINE: $line\n";

   #      @finalresult = (@finalresult, $line);

   #   }

   #}

   # Tracing:
   #print "\@finalresult =\n";
   #print "@finalresult\n\n";

   @finalresult = @grepip;      

   print "===================================================\n";
   print "Here is the config info for\n host [$hostn], client ip [$clientip]:\n";
   print "===================================================\n";
   print @finalresult;


} else {

   print "Useage:	getipcfg <tcpip address | hostname>\n\n";

}


print "END.\n\n";
