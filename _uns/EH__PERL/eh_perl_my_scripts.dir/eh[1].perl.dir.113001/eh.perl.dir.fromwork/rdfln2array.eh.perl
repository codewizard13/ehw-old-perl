#!/usr/bin/perl
# File rdlnprnttest.eh.perl created by Eric Hepperle at 14:00:26 on Wed Mar 21 2001. 

#if ($#ARGV < 0 || $ARGV[0] eq '-h') {
#    print "Usage:  rdlnprnttest [-h]\n";
#    exit;
#}

#***************************************************
# Reads entire input file into an array
#***************************************************

# Note: One must use the full path name when specifying
#       file locations, (i.e.: no tilde


unless (open (MYFILE, "/afs/rchland.ibm.com/usr3/v2cib484/tmp/ehperl.scrap1") ) {

   die ("cannot open input file ehperl.scrap1\n");

}

@input = <MYFILE>;

print (@input);

