#!/usr/bin/perl

#
# File:        facebookTest14.pl
# Author:      Eric Hepperle
# Created:     06/15/11
#
# Purpose:     Connect to Facebook and retrieve
#              user data from Graph API.
#

################################################################################
################################################################################
##
## Initialize / Declare Variables
##
################################################################################
################################################################################
#
#============================= facebookTest14.pl ==============================#
#
# NOTE: final version should be renamed "facebookAuthenticate.pl"
#
use strict;
use warnings;

use CGI;
use URI::Escape;
use Data::Dumper;
use JSON::XS;
use MIME::Base64::URLSafe; # does the +/ to _- translation for us!

my $MAIN_QUERY = CGI->new(); # Define the CGI object

#
# GET SIGNED REQUEST PARAMETERS PASSED FROM MAIN_QUERY:
#

# Represents the last octet of the client's ip address
my $tcpipClientID           = $MAIN_QUERY->param('clientId');
my $sessionAccessCode       = $MAIN_QUERY->param('code');

# This must match what is in the 'Canvas URL' field of Facebook's Developer
# page for the app.
my $canvasUrl = 'https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest14.pl';

# FACEBOOK OBJECT
my $fbApp = {
	'App ID' => '151589588248890',
	'App Secret' => 'afdfd141f46691c7e12ced5c45995520',
  'Canvas URL' => $canvasUrl,
  'TCPIP Client ID' => $MAIN_QUERY->{'clientId'},
  'Redirect URI' => $canvasUrl . '?clientId=' . $tcpipClientID,
};

# NOTE: REDIRECT URI of this form:
# https://192.168.1.218/v6/egov/apps/sandbox/alan.pl?clientId=218


################################################################################
################################################################################
##
## Routing
##
################################################################################
################################################################################


my $pageToLoad;

#
# If we receive a code, process and decrypt it and add results to the FB object
#
if ($sessionAccessCode)
{
	$pageToLoad = &fbProcessSignedRequest($sessionAccessCode);
}
else
{
	$pageToLoad = &fbShowAuthenticationScreen();
}

print $MAIN_QUERY->header('text/html') . $pageToLoad;

################################################################################
################################################################################
##
## Subroutines
##
################################################################################
################################################################################

## fbProcessSignedRequest ######################################################
#
#
#
sub fbProcessSignedRequest
{
  my ($saCode) = @_;
  
  
}



## fbShowAuthenticationScreen ##################################################
#
#
#
sub fbShowAuthenticationScreen
{
	my ($option) = @_;

	return fbPageOneHTML();
}

#
# redirect to https://graph.facebook.com/oauth/authorize giving
# Facebook my application id, the request type and the redirect url.
#
sub facebookLogin
{
  # Per the Facebook documentation, you have to redirect to:
  # https://graph.facebook.com/oauth/authorize to get things started.
  # There are 3 query string parameters you have to include with this URL:
  #
  # - client_id: this is your Application ID
  #
  # - redirect_uri: this is the URI Facebook will redirect to after
  #     authentication is successful. This URI must be prefixed with
  #     the Connect URL that you provided to Facebook and is case
  #     sensitive. The redirect_uri will be a controller action we
  #     provide in our Perl application.
  #
  # - type: there are two options for this, you can do user_agent or
  #    web_server as the type. Because we are not Authentication via
  #    javascript/asynchronously (AJAX), we will use the web_server option.
  #
  
  # NOTE: here client_id means APP ID
  my $facebookLoginUrl = 'https://graph.facebook.com/oauth/authorize?';
    $facebookLoginUrl .= 'type=web_server&';
    $facebookLoginUrl .= 'client_id=' . $fbApp->{'App ID'} . '&';
    $facebookLoginUrl .= 'redirect_uri=' . $fbApp->{'Redirect URI'};
  
  
  my $html = '<a href="' . $facebookLoginUrl . '">log in with Facebook</a>';
  
  return $html
  
    
}



################################################################################
################################################################################
##
## Constants
##
################################################################################
################################################################################

use constant fbPageOneHTML => qq~
<html>
	<head>
		<div id="fb-root"></div>
    <script src="http://connect.facebook.net/en_US/all.js#appId=151589588248890&amp;xfbml=1">
    </script>
    <fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>
	</head>
  
	<body>
		<h1>Test Facebook Authentication</h1>

		<a href="https://www.facebook.com/dialog/oauth?
      client_id=151589588248890&redirect_uri=https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest14.pl?clientId=43">
      Click here to Authorize this app</a>
      

	</body>
</html>~;
