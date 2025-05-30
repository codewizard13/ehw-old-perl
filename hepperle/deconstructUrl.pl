#!/usr/bin/perl
#
# Progaram:    deconstructUrl.pl
# Creator:     Eric Hepperle
# Date:        06/18/03
#
# Purpose:     Breaks a url down by standard
#              encoding rules.
#
#----------------------------------------------------

main();

#------------ [ MAIN PROGRAM ] -------------#

sub main
{
   initializeVariables();

   print "Enter the url you wish to deconstruct:\n\n";
   $theURL = <STDIN>;
   chomp($theURL);
   print "\n\n";

   # if nothing was entered
   if ($theURL eq "")
   {
      $theURL = $testUrl;

   } # end if

   findQueryString($theURL);

   # TRACING:
   print "Just finished sub \"findQueryString\" ...\n\n";

   # TRACING:
   print "The main url is:\n";
   print "$mainURL\n\n";
   print "The query string is:\n";
   print "$queryString\n\n";
   print "$secDiv\n\n";


   @mainUrlComponents = bestWayToSplitUrl($mainURL);
   print "\n\n";

   print "This is the best way to split the url:\n";
   print "@mainUrlComponents\n";

   print "\n\n";
   print "Protocol =     $protocol\n";
   print "Domain Name =  $domainName\n";
   print "URI =          $uri\n";
   print "Port =         $portNo\n";


   $hold = <STDIN>;

   splitMainUrl($mainURL);

   @queryVars = ("", splitQueryString($queryString) );

   $varCount = 1;
   foreach $var (@queryVars)
   {
      print "$var\n";
      $varCount++;

   } # end foreach


   $hold = <STDIN>;


} # END main




# this has a problem for some reason with concatenation.
sub initializeVariables
{
   $testUrl = "http://www.google.com/search?as_q=monster+garage&num=100&";
   $testUrl = "$testUrl" . "hl=en&ie=UTF-8&oe=UTF-8&btnG=Google+Search&as_epq=";
   $testUrl = "$testUrl" . "&as_oq=&as_eq=&lr=lang_en&as_ft=i&as_filetype=";
   $testUrl = "$testUrl" . "&as_qdr=all&as_occt=any&as_dt=";
   $testUrl = "$testUrl" . "i&as_sitesearch=&safe=images";
   $secDiv = "#**************************************************";


} # end sub initializeVariables




sub findQueryString
{
   ($myRawUrl) = @_;

   # remember to escape the "?"
   ($mainURL, $queryString) = split(/\?/, $myRawUrl);

   print "\n\n";

   @levelOne = ($mainURL, $queryString);

   return @levelOne;

} # end sub findQueryString




sub splitMainUrl
{
   ($myMainUrl) = @_;

   $myMainUrl =~ (/\A(.+?):\/\//);
   $protocol = $1;
   print "Protocol = $protocol\n\n";

#   $myMainUrl =~ (/




} # end sub splitMainUrl




sub splitQueryString
{
   ($myQuery) = @_;

   @queryVars = split(/&/, $myQuery);

   return @queryVars;

} # end sub splitQueryString




sub bestWayToSplitUrl
{
   ($myMainUrl) = @_;

   print "url=$myMainUrl\n";

   # use m|...| so that we do not need to use a lot of "\/"
   $myMainUrl =~ m|(\w+)://([^/:]+)(:\d+)?/(.*)|;
   $protocol = $1;
   $domainName = $2;
   $uri = "/" . $4;
   print "\$3=$3\n";

   if ($3 =~ /:(\d+)/) {
      $portNo = $1

   }
   else
   {
      $portNo = 80

   } # end if

   print "protocol=$protocol domainName=$domainName
   portNo=$portNo uri=$uri\n";

   return $protocol, $domainName, $uri, $portNo;

} # end sub bestWayToSplitUrl