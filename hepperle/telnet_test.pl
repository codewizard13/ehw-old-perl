#!/usr/bin/perl
#
#
# Program:	telnet_test.pl
# Creator:	Eric Hepperle
# Date:		02/08/02
#
# Purpose:	Demonstrates the Net_Telnet CPAN module.
#
###################################################
#
# Revisions:
#
#	- Original:  02/08/02
#
#	!!!! WORKS NOW !!!!
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#




print "\n\n";
print "This program is called telnet_test.pl\n\n";

#$username = v2cib484;
#$passwd = qwe5t5ux;
$remotehost = "doomsday.rchland.ibm.com";


print "Enter the hostname:\t ";
$remotehost = <STDIN>;
chomp $remotehost;
print "\n";


# KEY POINT WHEN USING THIS MODULE:
# --------------------------------
#
# The Prompt parameter must be set correctly or you will
#  get a timeout msg and the module will fail.
#
# Must assign username and passwd variables or script will fail.
#
#

use Net::Telnet ();

    $t = new Net::Telnet (Timeout => 10, Prompt => '/[\$%#>] $/');
    $t->open("$remotehost");
    $t->login($username, $passwd);

    # PERFORM "who" command on the remote host to see who is connected:
    @lines = $t->cmd("/usr/bin/who");
    print @lines;

    print "\n\n";

    # PRINT contents of the dce config file to the screen:
    @dcefile = $t->cmd("/bin/cat /etc/dce/dce_cf.db");
    print @dcefile, "\n";

    # COPY dce config file and make a backup:
    $makedcefilebkp = $t->cmp("/bin/cp -p /etc/dce/dce_cf.db /etc/dce/dce_cf.db.bkp");
    $makedcefilebkp;
    print "\n";


print "\n\n";
