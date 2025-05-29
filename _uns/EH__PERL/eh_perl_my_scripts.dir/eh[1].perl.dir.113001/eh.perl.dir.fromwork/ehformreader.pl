#!/usr/bin/perl
# File ehformreader.pl created by Eric Hepperle at 16:00:17 on Thu Aug 16 2001. 
#
# Not my script.  Form reader program.

# Replace the email address below with your own (Note: my@mail.com would be written 
# my\@mail.com). 
#$email = "my\@mail.com";
print ("What is your email address?\n");
$email = <STDIN>;
print ("\n");

chomp ($email);

# Please enter the location of sendmail.
$sm = "/usr/lib/sendmail";

#Your done.
################################################################################################
##     ##       ###    ##       # THIS SCRIPT WAS DEVELOPED BY:
##  #######   ####      #   ### #   ##########         #   #       #  ###  ### ###  #
##     ####   ####  ##  #       #       #   #         #   # #     #   #  # ##  #  # #
#####  ####   ####      #  ######      #   #    #    #   #   #   #    ###  #   ###  #  
#     S####  T#####   O## P######     #   #    #    #   #     # #     #     ## #  # ####COMPANY
#################################    #   ##### #####   #       #        A TWN MEDIA Company.

$date = `date +"%D"`;
$num=1;
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
open (MAIL, "|$sm $email") || die "Can't open $sm!\n"; 
print MAIL ("From: Ready-Form 1.0 <formbot\@serve.com>\n");
print MAIL ("To: Webmaster <$email>\n");
print MAIL ("Reply-To: formbot\@serve.com\n");
print MAIL ("Errors-To: $email\n");
print MAIL ("Sender: formbot\@serve.com\n");
print MAIL ("Subject: Form Results sent on $date \n");
print MAIL ("Hello,\n  This is your WWW Form Reader. The following data was submited \(See bottom for user details\).\n\n ");
@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{
($name, $value) = split(/=/, $pair);
$value =~ tr/+/ /;
$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$value =~ s/~!/ ~!/g; 
print MAIL ("\n$num. $name:\n$value\n");
$num = $num + 1; 
$form{$name} = $value;
} print MAIL ("\n\n---End of form data.---\n\nUser Info\nBROWSER: $ENV{'HTTP_USER_AGENT'}\nHOST: $ENV{'REMOTE_HOST'}\nSubmitted from: $ENV{'HTTP_REFERER'}\n\n(C)1997-98 TWN Perl Company, a division of TWN Media LTD.");
close(MAIL);
$url = $form{'url'};
if($url ne "") {
print ("Location: $url\n");
print ("Content-type: text/html\n\n");
}
else{
print ("Content-type: text/html\n\n");
print "<html><head><title>Form Submitted</title></head>\n
<body><!--Created by Ready Form 1.0 on $date-->\n
<h1>Form Submitted.</h1>\n
The form was submitted to the webmaster.<hr>\n
<i>ReadyForm 1.0</i> \(C\)1997-98 <a href='http://www.serve.com/twn/cgi/'>TWN Perl Company</a>, a division of 
TWN Media LTD.\n";
}
