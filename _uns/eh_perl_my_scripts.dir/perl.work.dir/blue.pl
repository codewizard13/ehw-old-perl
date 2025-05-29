#!/usr/bin/perl
#
# Program:	blue.pl
# Creator:	Brian Raver
# Date:		07/24/00
#
# Purpose:	Not my script.  Demonstrates ldap search commands. Does a lookup in bluepages and returns the attributes listed in the command for all employees in the "rocheste" directory. It is opened in a pipe so that we can format the data as it comes in.
#
########################################################


# 02/14/2001  PJW - modified the code to search two directories.

# This is the strip file we are going to write the output to.
open FILE, "> /usr/common/callup/rocheste";

open LDAP, "/bin/ldapsearch -V2 -h bluepages.ibm.com -b ou=bluepages,o=ibm.com directoryalias=rocheste filter attributes telephonenumber callupname primarynode primaryuserid buildingname floor physicaldeliveryofficename ibmserialnumber div dept |";
do_work();
close LDAP;

open LDAP, "/bin/ldapsearch -V2 -h bluepages.ibm.com -b ou=bluepages,o=ibm.com directoryalias=nibmus filter attributes telephonenumber callupname primarynode primaryuserid buildingname floor physicaldeliveryofficename ibmserialnumber div dept |";
do_work();
close LDAP;

# Close the file.
close FILE;
exit;

#################################
#  Start of the do_work function
#################################

sub do_work
{
    while (<LDAP>) {
	chomp $_;
# Split the name=value pairs that are returned from bluepages, and put them into a hash.
	if ($_ =~ /\w/) {
	    ($name, $value) = split(/=/, $_);
	    $FORM{$name} = $value;
	}
# Print the output to the strip file if there is a phone number returned from bluepages.
	elsif (defined $FORM{telephonenumber}){
# Split up the long phone number, and print without the prefix and area code (ie. 1-507).
	    ($pre, $area, $num1, $num2) = split(/-/, $FORM{telephonenumber});
	    print FILE "$num1" . "-" . "$num2" . ":";
	    if (defined $FORM{callupname}) {
		print FILE "$FORM{callupname}" . ":";
	    } 
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{primarynode}) {
		print FILE "$FORM{primarynode}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{primaryuserid}) {
		print FILE "$FORM{primaryuserid}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{buildingname}) {
		print FILE "$FORM{buildingname}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{floor}) {
		print FILE "$FORM{floor}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{physicaldeliveryofficename}) {
		print FILE "$FORM{physicaldeliveryofficename}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{ibmserialnumber}) {
		print FILE "$FORM{ibmserialnumber}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{div}) {
		print FILE "$FORM{div}" . ":";
	    }
	    else {
		print FILE " " . ":";
	    }
	    if (defined $FORM{dept}) {
		print FILE "$FORM{dept}\n";
	    }
	    else {
		print FILE " " . ":";
	    }
# Remove all data from the hash so that if something isn't defined for the next person, the previous person's data isn't carried over.
	    undef %FORM;
	}
# Remove all data from the hash if telephonenumber isn't defined for someone.
	else {
	    undef %FORM;
	}
    }
}
###############################
#  End of the do_work function
###############################
