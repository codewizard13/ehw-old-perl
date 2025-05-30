#!/usr/bin/perl
#
#
# Program:	ehformprocessor1.pl
# Creator:	Eric Hepperle
# Date:		01/11/02
#
# Purpose:	My first attempt to create an HTML form handler/processor with Perl.
#
###################################################
#
# Revisions:
#
#	- Original:  01/11/02
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "Content-type: text/html\n\n";  

print "\n\n";
print "This program is called ehformprocessor1.pl\n\n";


&ReadParse;


print "<title>The Response</title><h1>The Response</h1><hr>";

print "Here is the form data:<ul>";
             

# Prints the form data which was stored in the hash "%in".
#
foreach $key (keys %in) {

   print "<li>$key: $in{$key}";

   print "<BR>\$in{$key} =\t $in{$key}<BR>\n\n";

   
}

# assign these has vars to scalars:
   $volume_path = $in{volpath};
   $afs_passwd = $in{pass};
   $afs_id = $in{afsid};
   $desired_q = $in{dq};

# assign bumpquota command:
$bq = `fs sq $volume_path $desired_q





print "</ul>";
             
print "and here are all the environment variables:<ul>";

foreach $key (keys %ENV) {
   print "<li>$key: $ENV{$key}";
}

print "</ul>";
             
# Adapted from cgi-lib.pl by S.E.Brenner@bioc.cam.ac.uk 
# Copyright 1994 Steven E. Brenner 



####################################################
# READ & PARSE
####################################################

sub ReadParse {

   local (*in) = @_ if @_;

   local ($i, $key, $val);
            
   if ( $ENV{'REQUEST_METHOD'} eq "GET" ) { 

      $in = $ENV{'QUERY_STRING'}; 

   } elsif ($ENV{'REQUEST_METHOD'} eq "POST") {

      read(STDIN,$in,$ENV{'CONTENT_LENGTH'});

   } else {

   # Added for command line debugging
   # Supply name/value form data as a command line argument
   # Format: name1=value1\&name2=value2\&... 
   # (need to escape & for shell)
   # Find the first argument that's not a switch (-)

   $in = ( grep( !/^-/, @ARGV )) [0];
   $in =~ s/\\&/&/g;

   }
             
   @in = split(/&/,$in);
             
   foreach $i (0 .. $#in) {

      # Convert plus's to spaces
      $in[$i] =~ s/\+/ /g;
             
      # Split into key and value.
      ($key, $val) = split(/=/,$in[$i],2); # splits on the first =.
             
      # Convert %XX from hex numbers to alphanumeric
      $key =~ s/%(..)/pack("c",hex($1))/ge;       
      $val =~ s/%(..)/pack("c",hex($1))/ge;
             
      # Associate key and value. \0 is the multiple separator
      $in{$key} .= "\0" if (defined($in{$key})); 
      $in{$key} .= $val;
   }

   return length($in);

}



# subroutine for doing the afs quota bump.

# $bumpquota = `fs sq $volpath`;
$referer = $ENV{'HTTP_REFERER'};

print "<H3>The referer was\: $referer</H3><BR>\n\n";

print "$in{afsid}\n\n";


#print"The referer is $ENV{'HTTP_REFERER'}\n";
