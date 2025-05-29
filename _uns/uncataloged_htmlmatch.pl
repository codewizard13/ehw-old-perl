#!/usr/bin/perl
#
# Program:	uncataloged_htmlmatch.pl
# Creator:	Eric Hepperle
# Date:		10/05/01
#
# Purpose:	Not my script.  Searches a local text file and extracts all links.  Taken from:
#
# http://www.ics.uci.edu/pub/websoft/libwww-perl/archive/1994/0123.html
#
###################################################

# geturls - extract URLs from text

@urls = ();  # none yet

while (<>)
{
  if (/:\// && (
    (/http:/   && /http:[^\n ",')>]+/)   ||
    (/gopher:/ && /gopher:[^\n ",')>]+/) ||
    (/file:/   && /file:[^\n ",')>]+/)   ||
    (/ftp:/    && /ftp:[^\n ",')>]+/)    ||
    (/news:/   && /news:[^\n ",')>]+/) ) )
  {
    # yummy, looks like there's a URL in this line
    push(@urls,$&);
  }
}

sort(@urls);

$last = '';
foreach (@urls)
{
  if ($last ne $_)
  {
    print "$_\n";
    $last = $_;
  }
}
