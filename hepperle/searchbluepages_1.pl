#!/usr/bin/perl
#
#
# Program:	searchbluepages
# Creator:	Eric Hepperle
# Date:	11/16/01
#
# Purpose:	Uses perl to search blue pages.  Parses environment variables based on the "=" sign.  Allow use to specify which variables to see.
#
###################################################
#
# Revisions:
#
#	- Original:  11/16/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

# this program uses the file:
# blupages.envvarlist.ez
#
$varlist = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/bluepages.envvarlist.ez";

print "\n";

print "This program is called searchbluepages\n\n";

print "Enter the employee serial number: ";
$sernum = <STDIN>;
chomp $sernum;

$empinfo = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/bluepages.$sernum";

&makeuserlogfrombluepages;

print "Enter the name of the environment variable you wish to view: \n";
print " (Type \"helpenv\" to see list of variables) \n\n";

$envtoview = <STDIN>;
chomp $envtoview;

if ($envtoview eq "" || $envtoview eq "helpenv") {

   print "These are the variables that are available: \n";
   print "===========================================\n\n";

   &printenvvarlist;

} else {

   &getvarchoice;

}


#----------------------------------


$key = $envtoview;

%hash1;




sub makeuserlogfrombluepages {

   $getuserinfo = `ldapsearch -h bluepages.ibm.com -b "ou=bluepages,o=ibm.com" ibmserialnumber=$sernum`;

   # Tracing:
   print $getuserinfo;
   print "\n";

   open (EMPINFO, ">$empinfo");

      print EMPINFO $getuserinfo;

   close (EMPINFO);

   # verify file was created:
#   `/usr/tools/bin/ez $empinfo`;


}





sub printenvvarlist {


   open (VARLIST, $varlist);

      @varlist = <VARLIST>;

         foreach $el (@varlist) {

            @splitels = split(/=/, $el);
            print "$identifier -- $value -- $extra\n";    
           

            print "$el";

            @splitelttl = (@splitelttl, @splitels);

         }

   print "Press any key to view the split elements: ";
   $hold = <STDIN>;

   print "@splitelttl";

   print "\n";


   close (VARLIST);

}




sub getvarchoice {

   # open employee file for reading.
   open (EMPINFO, $empinfo);

      # store file contents in an array.
      @emp_info = <EMPINFO>;

      foreach $line (@emp_info) {

         @linearray = split(/=/, $line); 

         print "line = $line\n";
         print "@linearray[0] --  @linearray[1] \n\n";


      }


   #   @splitels = split(/=/, $el);
   #print "$identifier -- $value -- $extra\n";    
   #print "$el";
   #@splitelttl = (@splitelttl, @splitels);
   #print "Press any key to view the split elements: ";
   #$hold = <STDIN>;
   #print "@splitelttl";
  
}
