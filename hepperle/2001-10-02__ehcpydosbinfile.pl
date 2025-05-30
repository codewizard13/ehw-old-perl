#!/usr/bin/perl
# File ehcpydosbinfile.pl created by Eric Hepperle at 09:38:28 on Tue Jun  5 2001. 
#
# Supposed to demonstrate how to copy (upload/download) a binary file in perl.  Does not work.

use Cwd;

     $dir = cwd;

print "\n";

print "Enter the name of the binary file you want to duplicate: \n";
$binfile = <STDIN>;

# binmode( MY_FILE ); # Specify that the file is a binary.
# binmode( STDOUT );  # Tell the standard output stream should accept binary data.

chdir ("~v2cib484/ehtestfolder");



$testbinfile = 'blade1.jpg';
$CHUNK_SIZE = 4096;

    open( MY_FILE, "<$MY_FILE_NAME" )
      or die( "Can't open $MY_FILE_NAME: $!\n" );

    print "Content-type: image/jpeg\r\n";
    print "\r\n";

    binmode( MY_FILE ); # These are crucial!
    binmode( STDOUT );

    while ( $cb = read( MY_FILE, $data, $CHUNK_SIZE ) )
    {
      print $data;
    }
    
    close( MY_FILE );
