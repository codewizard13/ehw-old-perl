#!/usr/bin/perl
# File eh1stsrceng.pl created by Eric Hepperle at 10:16:53 on Thu Sep 20 2001. 
#
# Looks like this is a search engine script.  Not mine.  Does not work yet; may be missing modules.

#!/usr/bin/perl -Tw

use DB_File;
use File::Find;
use Time::Local;

# webcrawl.pl - create a full text index to a web site

# based on an idea by Brian Slesinsky
# http://www.webmonkey.com/code/97/16/index2a.html

$startpath = "/domain/http-docs";
$db = "search_index.db";
$db_current = $startpath . "/" . $db;
$db_new = $startpath . "/" . $db . ".new";
print $db_new;

# remove any previous attempt at indexing then create a new index file
unlink($db_new);
my %db;
dbmopen(%db, $db_new, 0644) or die "dbmopen: $!";
my $fileno = 0;

# scan and index every file
find(\&makeindex,$startpath);

# close the new index and replace any existing index
untie %db;
unlink($db_current);
link($db_new,$db_current) or die "link: $!";
unlink($db_new) or die "unlink: $!";

exit(0);

sub makeindex {
        if (/html$/) {

                # read the file content into $html
                $fullname = $File::Find::name;

                ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
                        $atime,$mtime,$ctime,$blksize,$blocks) = stat
$fullname;

                ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
localtime($mtime);
                $modtime = join '/', ++$mon, $mday, $year;

                print "$modtime indexing $fullname\n";
                open (HTML, $fullname) || print "open $fullname: $!\n";
                my $html = join ('', <HTML>);
                close HTML;

                # make a link to the file
                $fullname =~ s/$startpath//;
                $url = substr($fullname,1);             
                my ($title) =($html =~/<title>([^<]*)/i);
                $title = $url if (!defined $title);
                $url = "http://www.weaveware.com/" . $url;
                $db{--$fileno} = "<a href=\"$url\">$title $modtime</a>";

                # extract the words from the HTML
                $html =~ s/<[^>]+>//g;
                $html =~ tr/A-Z/a-z/;
                my @words = ($html =~ /\w+/g);

                # add this page to the inverted index
                my $last = "";
                for (sort @words) {
                        next if($_ eq $last);
                        $last = $_;
                        $db{$_} = defined $db{$_} ? $db{$_}.$fileno : $fileno;
                }
        }
}
