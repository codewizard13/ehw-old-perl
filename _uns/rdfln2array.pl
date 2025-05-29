#!/usr/bin/perl
#
# Program:	rdlnprnttest.pl
# Creator:	Eric Hepperle
# Date:		03/21/01
#
# Purpose:	Reads entire input file into an array
#
####################################################
#
# Note: One must use the full path name when specifying
#       file locations, (i.e.: no tilde)


unless (open (MYFILE, "/afs/rchland.ibm.com/usr3/v2cib484/tmp/ehperl.scrap1") ) {

   die ("cannot open input file ehperl.scrap1\n");

}

@input = <MYFILE>;

print (@input);

