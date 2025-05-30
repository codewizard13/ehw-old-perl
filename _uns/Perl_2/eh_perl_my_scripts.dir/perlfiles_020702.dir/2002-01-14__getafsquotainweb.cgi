#!/usr/bin/perl
#
#
# Program:	getafsquotainweb.pl
# Creator:	Eric Hepperle
# Date:	01/14/02
#
# Purpose:	Used as a form handler cgi script.  Retrieves and prints to screen user's afs quota.
#
###################################################
#
# Revisions:
#
#	- Original:  01/14/02
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
print "This program is called getafsquotainweb.pl\n\n";



&ReadParse;


print "<title>The Response</title><h1>The Response</h1><hr>";

print "Here is the form data:<ul>";


print "<BR>\n\n";

# Prints the form data which was stored in the hash "%in".
#
$count = 0;
foreach $key (keys %in) {

#   chomp $in{$key};

   print "<BR><li>$key: $in{$key}";


   print "<BR>\$in{$key} =\t $in{$key}<BR><BR>\n\n";
 print "key{$count} = $in{$key}<BR>\n\n";
  $count++;
   
}

print "\n\n";

print"<BR><B>\$in{volpath}:</B>\t$in{volpath}<BR><BR>\n\n";


# assign these hash vars to scalars:
   $volume_path = $in{volpath};

#   $afs_passwd = $in{pass};
#   $afs_id = $in{afsid};
#   $desired_q = $in{dq};



&getcurrentquota;


# assign bumpquota command:
#$bq = `fs sq $volume_path $desired_q`;


print "</ul>";
             

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



$referer = "$ENV{'HTTP_REFERER'}";

print "<H3>The referer was:</H3>$referer<BR>\n\n";

print "$in{afsid}\n\n";


#print"The referer is $ENV{'HTTP_REFERER'}\n";




sub getcurrentquota {

   $gg = (`fs listquota $volume_path`)[1];
   chop($gg);
   $gg =~ s/ +|\%/ /g;
   print "<BR><BR><B>\@gg =</B>fs lq $volume_path = $gg<BR><BR>\n\n";
   
  
   #print "<BR><B><H4>CURRENT AFS QUOTA:</H4></B>\t@gq<BR><BR>\n\n";
   #print "<BR><B><H4>2nd EL = </H4></B>\t $gq[1]<BR><BR>\n\n";

   # trace foreach loop:
#   foreach $el (@gq

}
