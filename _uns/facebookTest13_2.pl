################################################################################
################################################################################
##
## Initialize / Declare Variables
##
################################################################################
################################################################################

use strict;
use warnings;

use CGI;
use URI::Escape;
use Data::Dumper;
use JSON::XS;
use MIME::Base64::URLSafe; # does the +/ to _- translation for us!

my $MAIN_QUERY = CGI->new(); # Define the CGI object

my $accessTokenPayload = $MAIN_QUERY->param('code');
my $clientId           = $MAIN_QUERY->param('clientId');

my $result; # define which page to load
my $canvasUrl = 'https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest13.pl';

# facebook app id and secret
my $fbApp = {
	'App ID' => '151589588248890',
	'App Secret' => 'afdfd141f46691c7e12ced5c45995520',
  'Canvas URL' => $canvasUrl,
  'Access Token' => $accessTokenPayload,
  'Client ID' => $clientId,
  'Redirect URI' => $canvasUrl . '?clientId=' . $clientId,
};
#https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest13.pl?clientId=43
################################################################################
################################################################################
##
## Routing
##
################################################################################
################################################################################

if ($accessTokenPayload)
{
	$result = &traceToken($accessTokenPayload);
}
else
{
	$result = &fbShowLink();
}

print $MAIN_QUERY->header('text/html') . $result;

################################################################################
################################################################################
##
## Subroutines
##
################################################################################
################################################################################

## fbShowLink ##################################################################
#
#
#
sub fbShowLink
{
	my ($option) = @_;

	return fbPageOneHTML() . &authenticateMyApp();
}

## traceToken ################################################################
#
#
#
sub traceToken
{
	my $html = '<xmp>' . Dumper($MAIN_QUERY) . '</xmp>';
    $html .= '<hr><h2>Access Token:</h2>';
    $html .= '<xmp>' . $fbApp->{'Access Token'} . '</xmp>';
    $html .= '<hr><h2>Facebook App Values:</h2>';
    $html .= '<xmp>' . Dumper($fbApp) . '</xmp>';
    $html .= '<hr><h2>$scope</h2>';
    $html .= &getScope();
    $html .= '<hr><h2>Do Graph Api Stuff:</h2>';
    $html .= &doGraphApi($fbApp->{'Access Token'});
    

  return $html;

}


## getScope ####################################################################
#
#
#
sub getScope
{
   
  my @scopeArr = qw(
                    email
                    read_stream
                    publish_stream
                    create_event
                    rsvp_event
                    sms
                    offline_access
                    publish_checkins
                    manage_friendlists
                    );
                    
  my $scope = join(',',@scopeArr);                    
  
  return $scope;
}


## authenticateMyApp ###########################################################
#
#
#
sub authenticateMyApp
{
  my $appAuthUrl = 'https://graph.facebook.com/oauth/access_token?';
    $appAuthUrl .= 'client_id=' . $fbApp->{'App ID'} . '&';
    $appAuthUrl .= 'redirect_uri=' . $fbApp->{'Redirect URI'} . '&';
    $appAuthUrl .= 'client_secret=' . $fbApp->{'App Secret'} . '&';
    $appAuthUrl .= 'code=' . $fbApp->{'Access Token'};
    $appAuthUrl .= '&type=user_agent';
  
  my $html = '<H1>Authenticate User (Version 2)</H1>';
    $html .= '<a href="' . $appAuthUrl . '">Click to Authenticate and get a token</a>';
  
  return $html;
}



### authenticateUser ############################################################
##
##
##
#sub authenticateUser
#{
#  my ($option) = @_;
#
##https://www.facebook.com/dialog/oauth?client_id=YOUR_APP_ID&redirect_uri=YOUR_URL&scope=email,read_stream  
#  my $html = 'https://www.facebook.com/dialog/oauth?';
#    $html .= 'client_id=' . $fbApp->{'App ID'} . '&';
#    $html .= 'redirect_uri=' . $fbApp->{'Canvas URL'} . '&';
#    $html .= 'scope=' . &getScope();
#  #print $html;
#  return $html;
#}



## doGraphApi ##################################################################
#
#
#
sub doGraphApi
{
  my ($token) = @_;
  
  my $userId;
  
  #my $html = '<a href="https://graph.facebook.com/220439?access_token=' .
  #            $token . '">Click to get user info</a>';
  
  my $href = 'https://graph.facebook.com/oauth/authorize?';
    $href .= 'type=user_agent&';
    $href .= 'client_id=' . $fbApp->{'Client ID'} .'&';
    $href .= 'redirect_uri=' . $fbApp->{'Redirect URI'} . '&';
    $href .= 'scope=user_photos,email,user_birthday,user_online_presence';
    
  my $html = '<a href="' . $href . '">Click to get user info</a>';
              
  return $html;
}


#https://www.facebook.com/dialog/oauth?client_id=151589588248890&redirect_uri=https://192.168.1.218/v6/egov/apps/sandbox/alan.pl?clientId=218

################################################################################
################################################################################
##
## Constants
##
################################################################################
################################################################################

use constant fbPageOneHTML => qq~
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
  <head>
    <title>AUTHENTICATE USER</title>
    <script src="http://connect.facebook.net/en_US/all.js#appId=$fbApp->{'App ID'}&xfbml=1"></script>
  </head>
  <body>
    <h1>Test the CGI Script</h1>
    <form action="https://www.facebook.com/dialog/oauth?client_id=$fbApp->{'App ID'}&redirect_uri=$fbApp->{'Redirect URI'}?clientId=$fbApp->{'Client ID'}"
          method="post">
    <input name="myvar" />
    <input type="Submit" />
    </form>

    <fb:login-button perms="email,offline_access"show-faces="true">
    </fb:login-button>
    
    <h1>Test Facebook Authentication</h1>

		<a href="https://www.facebook.com/dialog/oauth?client_id=151589588248890&redirect_uri=https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest13.pl?clientId=43">Authorize</a>

<!--<H1>Authenticate User (Version 2)</H1>
    <a href="#">Click to Authenticate and get a token</a>

    &authenticateMyApp()
-->
  </body>
</html>
~;

#use constant fbPageOneHTML => qq~
#<html>
#	<head>
#		<script src="http://connect.facebook.net/en_US/all.js#appId=151589588248890&xfbml=1"></script>
#	</head>
#	<body>
#		<h1>Test Facebook Authentication</h1>
#
#		<a href="https://www.facebook.com/dialog/oauth?client_id=151589588248890&redirect_uri=https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest13.pl?clientId=43">Authorize</a>
#
#	</body>
#</html>~;
#
#		#<div id="fb-root"></div>
#		#<fb:login-button show-faces="false" width="50" max-rows="1"></fb:login-button>






#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#my $q = CGI->new();
#my @names = $q->param;
#
#print $q->header();
#
#my $app_id = "151589588248890";
#my $app_secret = "afdfd141f46691c7e12ced5c45995520";
#
#
#my $responseType = 'token';
#
#my $scope = "email,read_stream,publish_stream,create_event,rsvp_event," .
#                    "sms,offline_access,publish_checkins,manage_friendlists";
#
#
## CANVAS PAGE ... The graphical interface that will display in Facebook
#my $canvas_page = "https://192.168.1.43/v6/egov/apps/sandbox/facebook/facebookTest.html";
#
#
#my $auth_url =
#  "https://www.facebook.com/dialog/oauth/?scope=" . $scope .
#  "&client_id=" . $app_id . "&redirect_uri=" . uri_escape($canvas_page) .
#  "&response_type=" . $responseType;
#
#print qq~\$q->param('signed_request'): $q->param('signed_request')<BR />~;
#
#my $parseRequest = &parseSignedRequest( $q->param('signed_request'), $app_secret);
#
#
###############################
## THIS SHOULD POST TO USER'S FEED -- Works!
#my $message = "Apps on Facebook.com are cool!";
#print "<BR />\$message = $message<BR />";
#
#my $feed_url = "https://www.facebook.com/dialog/feed?app_id="
#       . $app_id . "&redirect_uri=" . uri_escape($canvas_page)
#       . "&message=" . $message;
#
#
#
#if ($q->param('post_id') eq '')
#{
#  print "<script> top.location.href='" . $feed_url . "'</script>";
#}
#else
#{
#  print "Feed Post Id: " . $q->param('post_id');
#}
#
#
#
#my $pageObj =
#  qq~
#  <html>
#
#    <HEAD>
#
#      <TITLE>HEPPERLE'S EGOV FACEBOOK APP TEST</TITLE>
#
#
#    </HEAD>
#
#    <body>
#      Hello $value!<BR />
#      <BR />
#      <a href="javascript:openNewWindow();">return to front page</a>
#      <BR /><BR />
#      <a href=$auth_url>Click here to authorize app access</a><BR />
#      <BR />
#      <h1>THIS IS THE URL THAT WILL BE CLICKED:</h1>
#      <h2>$auth_url</h2><BR />
#      \@names = @names<BR />
#      \$q->param('signed_request'): $q->param('signed_request')<BR />
#      <H1>Parsed signed_request</H1>
#      $parseRequest<BR />
#      <BR />
#      <a href=$feed_url>Click here to see a feed</a><BR />
#    </body>
#  </html>
#  ~;
#
#print $pageObj;
#
#
#sub parseSignedRequest
#{
#  my ($signed_request, $secret) = @_;
#
#print qq~<BR /><H5 style = 'color:red; font-weight: 4; background:yellow;'>
#            THESE ARE VALUES RETURNED BY parseSignedRequest()</H5>
#            ~;
## signed_request format:
## vlXgu64BQGFSQrY0ZcJBZASMvYvTHu9GQ0YM9rjPSso.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsIjAiOiJwYXlsb2FkIn0
##
#print qq~signed_request: $signed_request<BR /><BR />~;
#
#  my ($encoded_sig, $payload) = split(/\./, $signed_request, 2);
#
#print qq~encoded_sig:  $encoded_sig<BR /><BR />
#         payload:      $payload<BR /><BR />
#      ~;
#
##  # decode the data
##  my $sig = base64UrlDecode($encoded_sig);
##  my $data = decode_json(decode_base64($payload));
##
### TESTING ... doesn't work
##print qq~$sig<BR />~;
#
#  #if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
#  #  error_log('Unknown algorithm. Expected HMAC-SHA256');
#  #  return null;
#  #}
#  #
#  ## check sig
#  #$expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
#  #if ($sig !== $expected_sig) {
#  #  error_log('Bad Signed JSON signature!');
#  #  return null;
#  #}
#  #
#  #return $data;
#}
#

#
#
#
