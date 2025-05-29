#!/usr/bin/perl
#
# Program:	mail_form.pl
# Creator:	Eric Hepperle
# Date:		06/22/01
#
# Purpose:	Not my script.  Mail Form Handler.  Doesn't quite work yet.
#
###########################################################


## Mail Form Handler (mail_form.pl) Copyright 1998-1999 by Tim Stevenson, tstevens\@employees.org
## Generic HTML form-processing CGI script

## Version 3.1 -- Modified July 2000
## Version 3.0 -- Modified July 1999
## Version 2.0 -- Modified January 1998
## Version 1.0 -- Modified March 1997

## Based on mailit.pl by ccoluzzi\@cisco.com; ReadParse subroutine by Steven E. Brenner

$version = "3.1";

# Supported "special" form fields and their "required" versions are contained
# in the array \@specials (except the special case for "Full Name", which sometimes
# should be displayed).
@special_fields = ("Recipient Address", "Email Address", "Cc Address", "Auto Cc", "Email Subject Line", "Background Color", "Link Color", "ActiveLink Color", "VisitedLink Color", "Text Color", "Toggle Graphics", "Required Graphic", "Graphic", "Magic Word", "Response Page Title", "Greeting", "Return URL", "Return Link Text", "Show Blanks", "Show Results");
foreach (@special_fields) {
push (@specials, $_);
$_ =~ s/$/*/;
push (@specials, $_);
}

# Get info about script and server
$script_filename = $script_path = $ENV{SCRIPT_NAME};
$script_filename =~ s#.*/([^/]+)$#\1#;
$script_path =~ s#^//#/#;
$server = $ENV{SERVER_NAME};
$server =~ s#/##g;

# Default Variables
$ADDRESS = $DEF_ADDRESS = "noone\@domain.com";
$EMAIL_ADDRESS = $DEF_EMAIL_ADDRESS = $RETURN_ADDRESS = "nobody";
$COPY_ADDRESS = $DEF_COPY_ADDRESS = "";
$AUTO_COPY = $DEF_AUTO_COPY = "No";
$FULL_NAME = $DEF_FULL_NAME = "exclude;Mail Form Handler";
$SUBJECT = $DEF_SUBJECT = "Form Submission";
$BKGD_COLOR = $DEF_BKGD_COLOR = "white";
$LINK_COLOR = $DEF_LINK_COLOR = ""; #unspecified
$ALINK_COLOR = $DEF_ALINK_COLOR = ""; #unspecified
$VLINK_COLOR = $DEF_VLINK_COLOR = ""; #unspecified
$TEXT_COLOR = $DEF_TEXT_COLOR = "black";
$REQUIRED_URL = $DEF_REQUIRED_URL = "http://server.domain.com/imglib/some.gif";
$TOGGLE_GRAPHICS = $DEF_TOGGLE_GRAPHICS = "On";
$GRAPHIC_URL = $DEF_GRAPHIC_URL = "http://server.domain.com/imglib/some_other.gif";
$MAGIC = $DEF_MAGIC = "";
$TITLE = $DEF_TITLE = "Mail Form Handler Response";
$GREETING = $DEF_GREETING = "Thank you for your form submission.";
$RETURN_URL = $DEF_RETURN_URL = "";
$RETURN_LINK_TEXT = $DEF_RETURN_LINK_TEXT = "";
$SHOW_BLANKS = $DEF_SHOW_BLANKS = "No";
$SHOW_RESULTS = $DEF_SHOW_RESULTS = "No";
$bad = 0;


#Print the HTTP header
print "Content-type: text/html", "\n\n";

# ReadParse subroutine handles form input
# If the code in this subroutine isn't working well with your server, 
# visit the cgi-lib.pl home page on the web to find a version that works better.
&ReadParse;

# If they don't use "POST", return the help file
if ($ENV{'REQUEST_METHOD'} eq "GET") {
$bad = 1;
$TITLE = "Mail Form Handler Help";
}

if ($ENV{'CONTENT_LENGTH'} == 0) {
$bad = 1;
$TITLE = "Mail Form Handler Help";
}

if ( $bad == 1 ) {
&LocateSendmailRoutine;
&HelpFile;
exit (0);
}

# Check the input names to see which fields are required, which are optional
foreach (keys %in) {
if ($_ =~ /\*$/) {
$required_fields{$_} = "";
}
} #end foreach


## Replace Default values as necessary

# REPLACE DEFAULT BACKGROUND COLOR, IF REQUIRED
if ($in{'Background Color'} ne "") {
$BKGD_COLOR = "bgcolor=\"$in{'Background Color'}\"";
} elsif ($in{'Background Color*'} ne "") {
$BKGD_COLOR = "bgcolor=\"$in{'Background Color*'}\"";
}

# REPLACE DEFAULT LINK COLOR, IF REQUIRED
if ($in{'Link Color'} ne "") {
$LINK_COLOR = "link=\"$in{'Link Color'}\"";
} elsif ($in{'Link Color*'} ne "") {
$LINK_COLOR = "link=\"$in{'Link Color*'}\"";
}

# REPLACE DEFAULT ACTIVE LINK COLOR, IF REQUIRED
if ($in{'ActiveLink Color'} ne "") {
$ALINK_COLOR = "alink=\"$in{'ActiveLink Color'}\"";
} elsif ($in{'ActiveLink Color*'} ne "") {
$ALINK_COLOR = "alink=\"$in{'ActiveLink Color*'}\"";
}

# REPLACE DEFAULT VISITED LINK COLOR, IF REQUIRED
if ($in{'VisitedLink Color'} ne "") {
$VLINK_COLOR = "vlink=\"$in{'VisitedLink Color'}\"";
} elsif ($in{'VisitedLink Color*'} ne "") {
$VLINK_COLOR = "vlink=\"$in{'VisitedLink Color*'}\"";
}

# REPLACE DEFAULT TEXT COLOR, IF REQUIRED
if ($in{'Text Color'} ne "") {
$TEXT_COLOR = "text=\"$in{'Text Color'}\"";
} elsif ($in{'Text Color*'} ne "") {
$TEXT_COLOR = "text=\"$in{'Text Color*'}\"";
}

# REPLACE DEFAULT ADDRESS, IF REQUIRED
$special_field = "Recipient Address";
if ($in{'Recipient Address'} ne "") {
$ADDRESS = "$in{'Recipient Address'}";
&EmailCheck ($ADDRESS);
} elsif ($in{'Recipient Address*'} ne "") {
$ADDRESS = "$in{'Recipient Address*'}";
&EmailCheck ($ADDRESS);
}

# REPLACE DEFAULT EMAIL ADDRESS, IF REQUIRED
$special_field = "Email Address";
if ($in{'Email Address'} ne "") {
$EMAIL_ADDRESS = "$in{'Email Address'}";
&EmailCheck ($EMAIL_ADDRESS);
} elsif ($in{'Email Address*'} ne "") {
$EMAIL_ADDRESS = "$in{'Email Address*'}";
&EmailCheck ($EMAIL_ADDRESS);
}

# REPLACE DEFAULT FULL NAME, IF REQUIRED
$exclude = 0;
if ($in{'Full Name'} ne "") {
$FULL_NAME = "$in{'Full Name'}";
} elsif ($in{'Full Name*'} ne "") {
$FULL_NAME = "$in{'Full Name*'}";
}
if ($FULL_NAME =~ /^exclude;/) {
$FULL_NAME =~ s/^exclude;//;
$exclude = 1;
}

# REPLACE DEFAULT CC ADDRESS, IF REQUIRED
$special_field = "Cc Address";
if ($in{'Cc Address'} ne "") {
$COPY_ADDRESS = "$in{'Cc Address'}";
&EmailCheck ($COPY_ADDRESS);
$COPY_FLAG = 1;
} elsif ($in{'Cc Address*'} ne "") {
$COPY_ADDRESS = "$in{'Cc Address*'}";
&EmailCheck ($COPY_ADDRESS);
$COPY_FLAG = 1;
}

# REPLACE DEFAULT AUTO CC VALUE, IF REQUIRED
if ($in{'Auto Cc'} ne "") {
$AUTO_COPY = "$in{'Auto Cc'}";
} elsif ($in{'Auto Cc*'} ne "") {
$AUTO_COPY = "$in{'Auto Cc*'}";
}
if ($AUTO_COPY eq "Yes") {
if ($COPY_FLAG == 1){
$COPY_ADDRESS .= ", ";
}
$COPY_ADDRESS .= $EMAIL_ADDRESS;
}


# REPLACE DEFAULT SUBJECT, IF REQUIRED
if ($in{'Email Subject Line'} ne "") {
$SUBJECT = "$in{'Email Subject Line'}";
} elsif ($in{'Email Subject Line*'} ne "") {
$SUBJECT = "$in{'Email Subject Line*'}";
}

# REPLACE DEFAULT TITLE, IF REQUIRED
if ($in{'Response Page Title'} ne "") {
$TITLE = "$in{'Response Page Title'}";
} elsif ($in{'Response Page Title*'} ne "") {
$TITLE = "$in{'Response Page Title*'}";
}

# REPLACE DEFAULT TOGGLE GRAPHICS VALUE, IF REQUIRED
if ($in{'Toggle Graphics'} ne "") {
$TOGGLE_GRAPHICS = "$in{'Toggle Graphics'}";
} elsif ($in{'Toggle Graphics*'} ne "") {
$TOGGLE_GRAPHICS = "$in{'Toggle Graphics*'}";
}

# REPLACE DEFAULT GRAPHIC, IF REQUIRED
if ($in{'Graphic'} ne "") {
$GRAPHIC_URL = "$in{'Graphic'}";
} elsif ($in{'Graphic*'} ne "") {
$GRAPHIC_URL = "$in{'Graphic*'}";
}

$GRAPHIC = "<IMG SRC=\"$GRAPHIC_URL\">";

# REPLACE DEFAULT REQUIRED GRAPHIC, IF REQUIRED
if ($in{'Required Graphic'} ne "") {
$REQUIRED_URL = "$in{'Required Graphic'}";
} elsif ($in{'Required Graphic*'} ne "") {
$REQUIRED_URL = "$in{'Required Graphic*'}";
}

$REQUIRED_GRAPHIC = "<IMG SRC=\"$REQUIRED_URL\">";

# REPLACE DEFAULT MAGIC WORD, IF REQUIRED
if ($in{'Magic Word'} ne "") {
$MAGIC = "$in{'Magic Word'}";
} elsif ($in{'Magic Word*'} ne "") {
$MAGIC = "$in{'Magic Word*'}";
}

# REPLACE DEFAULT SHOW BLANKS, IF REQUIRED
if ($in{'Show Blanks'} ne "") {
$SHOW_BLANKS = "$in{'Show Blanks'}";
} elsif ($in{'Show Blanks*'} ne "") {
$SHOW_BLANKS = "$in{'Show Blanks*'}";
}

$display_blanks = 0;
if ($SHOW_BLANKS eq "No") {
     $display_blanks = 1;
}

# REPLACE DEFAULT SHOW RESULTS, IF REQUIRED
if ($in{'Show Results'} ne "") {
$SHOW_RESULTS = "$in{'Show Results'}";
} elsif ($in{'Show Results*'} ne "") {
$SHOW_RESULTS = "$in{'Show Results*'}";
}

# REPLACE DEFAULT RETURN URL, IF REQUIRED
if ($in{'Return URL'} ne "") {
$RETURN_URL = "$in{'Return URL'}";
} elsif ($in{'Return URL*'} ne "") {
$RETURN_URL = "$in{'Return URL*'}";
}

# REPLACE DEFAULT RETURN_LINK_TEXT, IF REQUIRED
if ($in{'Return Link Text'} ne "") {
$RETURN_LINK_TEXT = "$in{'Return Link Text'}";
} elsif ($in{'Return Link Text*'} ne "") {
$RETURN_LINK_TEXT = "$in{'Return Link Text*'}";
}

# REPLACE DEFAULT GREETING, IF REQUIRED
if ($in{'Greeting'} ne "") {
$in{'Greeting'} =~ s/\*/<p>/g;
$GREETING = "$in{'Greeting'}";
} elsif ($in{'Greeting*'} ne "") {
$in{'Greeting'} =~ s/\*/<p>/g;
$GREETING = "$in{'Greeting*'}";
}

# End default replacements


# Make sure required fields have values assigned to them
foreach $item (keys (%required_fields)) {
$value = $item;
chop ($item);
        if ($in{$value} eq "" || $in{$value} eq $MAGIC) {
  $TITLE = "Required Fields";
        $errormsg .= "<LI><b>$item</b>\n";
        }
}


# Check the Title for formatting info
if ($TITLE =~ /^center;/) {
$TITLE =~ s/^center;//;
$center = 1;
}

# Run the subroutine to print the page header 
&PageHeaderRoutine;


# If some required fields aren't filled in, tell 'em about it
if ($errormsg ne "") {

if ($center == 1) {
print "<center>\n";
}

if ($TOGGLE_GRAPHICS eq "On") {
print "$REQUIRED_GRAPHIC\n";
}

if ($center == 1) {
print "</center>\n";
}

print <<"error_message";
<p>The following field(s) have to be completed before this form can be processed.
<p>
<UL>
$errormsg
</UL>
<P>Use your browser's <b>Back</b> button to return to the form and complete these field(s) as required.
error_message

&FooterCode;

print "</body>\n</html>\n";

exit (0);
}

# Otherwise, ...
else {

if ( open (EMAIL, "|/usr/lib/sendmail \"-f${RETURN_ADDRESS}\" -t") != 0 ) {

$blank = 1;


# Prepare the email header
print EMAIL <<"email_header";
To: $ADDRESS
From: $EMAIL_ADDRESS ($FULL_NAME)
Subject: $SUBJECT
email_header

if ($COPY_ADDRESS ne "") {
print EMAIL "Cc: $COPY_ADDRESS\n";
}
if ($RETURN_ADDRESS ne "nobody") {
print EMAIL "Reply-To: $RETURN_ADDRESS\n";
}

# End header
print EMAIL "\n";

# Print the date and time of form submission in the email body
$date_string = `date`;
chop($date_string);

print EMAIL "Form location: $ENV{HTTP_REFERER}\nSubmitted: $date_string from $server\n\n";

# Center heading elements if requested
if ($center == 1) {
print "<center>\n";
}
if ($TOGGLE_GRAPHICS eq "On") {
print "$GRAPHIC\n";
}

print "<br>\n<h2>$TITLE</h2>\n";

if ($center == 1) {
print "</center>\n";
}

print "$GREETING\n";

if ($SHOW_RESULTS eq "Yes") {
print "<p>\n<table cols=2 border=0>\n";
}


# FORLOOP is the block that reads each input name/value pair and prints it to
# the email and the screen

FORLOOP: for ( $x=0; $x<=$#in; $x++)
{
$blank = 0;

@form = split (/=/ , $in[$x] , 2);

push (@form_names, $form[0]);
push (@form_values, $form[1]);

# Exclude the "special" form fields from output

foreach $special_test (@specials) {
if ($form_names[$x] eq $special_test) {
  next FORLOOP;
  }
}

# If Show Blanks equals No then skip any inputs with null values.
if ($display_blanks == 1 && $form_values[$x] eq "") {
next FORLOOP;
}

if ($exclude == 1 && $form_names[$x] =~ /Full Name/) {
next FORLOOP;
}

$form_names[$x] =~ s/\*$//;

# The form name/value pairs are placed in the email as printf-formated text
printf EMAIL ("%-22s %-60s \n\n", "$form_names[$x]:", "$form_values[$x]");


# The form name/value pairs are returned onscreen, if Show Results eq Yes
if ($SHOW_RESULTS eq "Yes") {
print "<tr valign=top><td width=150><b>$form_names[$x]<\/b><\/td>\n<td> $form_values[$x]<\/td><\/tr>\n";
} # end if

}


# Finish the page up

if ($SHOW_RESULTS eq "Yes") {
print "</table>\n";
}

if ($RETURN_URL ne "" && $RETURN_LINK_TEXT ne "") {
print "<p><a href=$RETURN_URL>$RETURN_LINK_TEXT</a>\n";
}

&FooterCode;
print "</body>\n</html>\n";


# Handle case where script is run from the command line.
if ( $blank == 1 ) {
$server = `hostname` unless $! != 0;
if ($server eq "") {
$server = "<unknown host>";
}
($cmdline_user, $j1, $j2, $j3, $j4, $cmdline_users_host) = split (/\s+/, `who am i`);
$cmdline_users_host =~ s#\((.+)\)#\1#;


print EMAIL "Message from the Mail Form Handler on $server:\n";
print EMAIL "There was no form input received. Looks like " . $cmdline_user . " at " . $cmdline_users_host . " is running this script from the command-line.\n";
}

close (EMAIL);


$blank == 1 ? "No input! " : "";
    }
    else
    {
        print "/usr/lib/sendmail: <b>$!</b><p>\n";
        print "Comment failed.<p>\n";
  }
}

exit (0);


## Subroutines follow:

# ReadParse subroutine
# Courtesy of Steven E. Brenner's cgi-lib.pl

# Reads in GET or POST data, converts it to unescaped text, and puts
# one key=value in each member of the list "\@in"
# Also creates key/value pairs in %in, using '\0' to separate multiple
# selections

# If a variable-glob parameter (e.g., *cgi_input) is passed to ReadParse,
# information is stored there, rather than in $in, \@in, and %in.


sub ReadParse {
    local (*in) = @_ if @_;

  local ($i, $loc, $key, $val);

  # Read in text
  if ($ENV{'REQUEST_METHOD'} eq "GET") {
    $in = $ENV{'QUERY_STRING'};
  } elsif ($ENV{'REQUEST_METHOD'} eq "POST") {
    read(STDIN,$in,$ENV{'CONTENT_LENGTH'});
  }

  @in = split(/&/,$in);

  foreach $i (0 .. $#in) {
    # Convert plus's to spaces
    $in[$i] =~ s/\+/ /g;

    # Convert %XX from hex numbers to alphanumeric
    $in[$i] =~ s/%(..)/pack("c",hex($1))/ge;

    # Split into key and value.
    ($key, $val) = split(/=/,$in[$i],2); # splits on the first =.
    $in{$key} .= '\0' if (defined($in{$key})); # \0 is the multiple separator
    $in{$key} .= $val;
  }

  return 1; # just for fun
}

# Subroutine to search for the sendmail binary on the server

sub LocateSendmailRoutine {
$sendmail_string = "Located the sendmail binary on this server in directory: ";
if (-e '/usr/lib/sendmail'){
$sendmail_bin = $sendmail_string . "<b>/usr/lib/</b>" . "\n<br>This is the default location, no modification necessary.";
} elsif (-e '/usr/bin/sendmail'){
$sendmail_bin = $sendmail_string . "<b>/usr/bin/</b>" . "\n<br>You must modify the script to use the sendmail binary in this location.";
} elsif (-e '/usr/sbin/sendmail') {
$sendmail_bin = $sendmail_string . "<b>/usr/sbin/</b>" . "\n<br>You must modify the script to use the sendmail binary in this location.";
} else { $sendmail_bin = "Could not locate the sendmail binary in /usr/lib, /usr/bin, or /usr/sbin/.<br>You must locate the binary on your server and modify the script to use the sendmail binary in that location."};
}


# Subroutine to print the page header and body statement

sub PageHeaderRoutine {
# PRINT THE PAGE HEADER AND BODY STATEMENT
print <<"page_header_and_body_statement";
<html>
<head>
<title>$TITLE</title>
</head>
<body $BKGD_COLOR $LINK_COLOR $ALINK_COLOR $VLINK_COLOR $TEXT_COLOR>
page_header_and_body_statement
}


# Subroutine to verify validity of Email address

sub EmailCheck {
local ($bad_email) = 0;
local ($ADDRESS_STRING_ARG) = $_[0];
local (@addresses) = split (/ *, */, $ADDRESS_STRING_ARG);
foreach $current_address (@addresses) {
# checking for wacky characters and other no-nos in the email address
if (($current_address =~ /[\[\]\{\};><\(\):&#\$^*\\\/`%!\s]/) || ($current_address !~ /@/) || ($current_address =~ /^@/) || ($current_address =~ /\@$/) || ($current_address =~ /@.*@/)) {
$TITLE = "Invalid Email Address";
$current_address =~ s/</&lt;/g;
$current_address =~ s/>/&gt;/g;
&PageHeaderRoutine;
print <<"bad_email_address_message";
<h3>$TITLE</h3>
<p>The email address specified in the "<b>$special_field</b>" field, <b>$current_address</b>, is invalid.
<P>Use your browser's <b>Back</b> button to return to the form and specify a valid email address (<i>user\@domain</i>).
bad_email_address_message

&FooterCode;
print "</body>\n</html>\n";
exit(0);
}
}
}


# Subroutine that prints out the Help page

sub HelpFile {
print <<"help_file";
<html>
<head>
<title>$TITLE</title>
</head>
<body bgcolor=#FFFFFF>

<h2>Mail Form Handler Built-In Help</h2>

<!-- NOTE: THIS HELP FILE SHOULD BE VIEWED IN A WEB BROWSER, NOT FROM THE COMMAND LINE. POINT YOUR BROWSER AT THIS CGI FILE TO VIEW -->
<hr>
<h3>Version</h3>
<p>Version $version

<a name="overview"><h3>Overview</h3></a>
<p>The Mail Form Handler ($script_filename) is a generic CGI script designed to email HTML form input to a specified user or users. All your forms can point to a single instance of the script because the script can support any number of HTML forms while providing customizable output for each.

<p>Detailed help, including functional descriptions of each special form field, is available at the <a href="http://www.employees.org/~tstevens/mail_form/">Mail Form Handler home page</a>.
<p>
<p><h3>Sendmail Location</h3>
<p>$sendmail_bin
<p>
<p><a name="defaults"><h3>Default Special Form Field Values</h3></a>
<table cols=2 border=1 width=450>
<tr valign=top>
<td>
<b>Special Field Name</b>
</td>
<td>
<b>Default Value</b>
</td>
</tr>

<tr valign=top>
<td>
Recipient Address
</td>
<td>
$DEF_ADDRESS
</td>
</tr>

<tr valign=top>
<td>
Email Address
</td>
<td>
$DEF_EMAIL_ADDRESS
</td>
</tr>

<tr valign=top>
<td>
Cc Address
</td>
<td>
$DEF_COPY_ADDRESS
</td>
</tr>

<tr valign=top>
<td>
Auto Cc
</td>
<td>
$DEF_AUTO_COPY
</td>
</tr>

<tr valign=top>
<td>
Full Name
</td>
<td>
 $DEF_FULL_NAME
</td>
</tr>

<tr valign=top>
<td>
Email Subject Line
</td>
<td>
$DEF_SUBJECT
</td>
</tr>

<tr valign=top>
<td>
Background Color
</td>
<td>
$DEF_BKGD_COLOR
</td>
</tr>

<tr valign=top>
<td>
Link Color
</td>
<td>
$DEF_LINK_COLOR
</td>
</tr>

<tr valign=top>
<td>
ActiveLink Color
</td>
<td>
$DEF_ALINK_COLOR
</td>
</tr>

<tr valign=top>
<td>
VisitedLink Color
</td>
<td>
$DEF_VLINK_COLOR
</td>
</tr>

<tr valign=top>
<td>
Text Color
</td>
<td>
$DEF_TEXT_COLOR
</td>
</tr>

<tr valign=top>
<td>
Toggle Graphics
</td>
<td>
$DEF_TOGGLE_GRAPHICS
</td>
</tr>

<tr valign=top>
<td>
Required Graphic
</td>
<td>
$DEF_REQUIRED_URL
</td>
</tr>

<tr valign=top>
<td>
Graphic
</td>
<td>
$DEF_GRAPHIC_URL
</td>
</tr>

<tr valign=top>
<td>
Magic Word
</td>
<td>
$DEF_MAGIC
</td>
</tr>

<tr valign=top>
<td>
Response Page Title
</td>
<td>
$DEF_TITLE
</td>
</tr>

<tr valign=top>
<td>
Greeting
</td>
<td>
$DEF_GREETING
</td>
</tr>

<tr valign=top>
<td>
Return URL
</td>
<td>
$DEF_RETURN_URL
</td>
</tr>

<tr valign=top>
<td>
Return Link Text
</td>
<td>
$DEF_RETURN_LINK_TEXT
</td>
</tr>

<tr valign=top>
<td>
Show Results
</td>
<td>
$DEF_SHOW_RESULTS
</td>
</tr>

<tr valign=top>
<td>
Show Blanks
</td>
<td>
$DEF_SHOW_BLANKS
</td>
</tr>

</table>

<p><a name="credits"><h3>Credits</h3></a>
<p>Mail Form Handler $version ($script_filename) by Tim Stevenson<br>
Generic HTML form-processing CGI script<br>
Send bug reports, feature requests, and other correspondence to <a href="mailto:tstevens\@employees.org">tstevens\@employees.org</a><br>
Visit the <a href="http://www.employees.org/~tstevens/mail_form/">Mail Form Handler home page</a>.


<p>Based on mailit.pl by ccoluzzi\@cisco.com; ReadParse subroutine by Steven E. Brenner

<p>This script may be distributed freely as long as this message remains intact.<br>
<b>Disclaimer:</b> The Mail Form Handler is provided as-is. I shall not be held responsible for its performance in any respect.</font>

help_file

&FooterCode;

print "<!-- NOTE: THIS HELP FILE SHOULD BE VIEWED IN A WEB BROWSER, NOT FROM THE COMMAND LINE. POINT YOUR BROWSER AT THIS CGI FILE TO VIEW -->\n";

print "</body>\n</html>\n";
}


# Subroutine that prints out the page footer
sub FooterCode {
print <<"footer_end";
 <p><hr>
<font size=-1>This page generated by the Mail Form Handler $version ($script_filename), by Tim Stevenson<br>
For more information, visit <a href="http://$server$script_path">http://$server$script_path</a></font>
<p>
footer_end
}
