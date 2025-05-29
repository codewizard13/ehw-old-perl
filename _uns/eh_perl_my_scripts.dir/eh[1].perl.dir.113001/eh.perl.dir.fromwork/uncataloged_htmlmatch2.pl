#!/usr/bin/perl
# File uncataloged_htmlmatch2.pl created by Eric Hepperle at 13:00:22 on Fri Oct  5 2001. 
# Not my script.  Taken from:
#
# http://www.uic.edu/depts/accc/seminars/perlii/example.shtml


               use Getopt::Std;        ## needed for getopts

                   getopts('hf:u:m:');
                   usage() if $opt_h;

                   $f_path = $opt_f;
                   $u_path = $opt_u;
                   $max = $opt_m || 20;   # default of 20 urls max

               ## Initialize queue from ARGV or STDIN
                   while ( <> ) {
                       chomp;
                       s/^\s*//;
                       s/\s*$//;
                       push ( @queue, $_ );
                   }

               ##
               ## Process queue
               ## Results are put into %titles by expand()
               ##
                   $count=1;
                   while ( @queue ) {
                       $page = shift @queue;
                       push (@queue, expand($page));
                       last if (++$count >$max);
                   }

               ##
               ## Print site map
               ## Note that %titles are indexed by urls
               ##
                   %urls = reverse %titles;
                   if ( scalar(keys %urls) != scalar(keys %titles) ) {
                       print STDERR "Warning: Some titles are not unique.\n";
                       print STDERR "Listing is by unique title\n";
                   }
                   print <<EOF;
               <html><head><title>Site Map</title></head>
               <body>
               <h1>List of Files</h1>
               <ul>
               EOF
                   foreach my $title (sort keys %urls) {
                       print "<li><a href=\"$urls{$title}\">$title</a>\n";
                   }
                   print "</ul>\n</body></html>\n";

               ############################################
               ## Accepts url as argument.
               ## Finds file, opens it, records title
               ## and returns any new urls found within
               ##
               sub expand {
                   my $page = shift;
                   my @list = ();
                   my @refs = ();


                   my ($machine, $filepath) = ($page =~ m!^http://  # begin
                                                           ([^/]+)  # machine
                                                           (\/.*)$  # path
                                                         !x );

                       ## Change url path into file path.
                       ## Note /o since paths won't change.
                       ##
                   $filepath =~ s/^$u_path/$f_path/o;

                   foreach $default ( "", "index.html", "/index.html") {

                           ## Check file existence.
                           ## Either concat operator or quoted string needed
                           ##
                       next unless ( -e $filepath.$default );

                           ## Slurp up entire file.
                           ## Note use of "local" so $/ is recovered
                           ##   when block exits.
                           ##
                       open (F, "<$filepath$default") or next;
                       local $/;
                       my $file = <F>;

                           ## Extract title and record it.
                           ## Note /i in case of TITLE and /s
                           ##   if title spans multiple lines.
                           ##
                       $file =~ m#<title>(.*?)</title>#si;
                       $titles{$page} = $1;

                           ## Extract urls from $file
                           ## Note /g to get all matches
                           ##
                       @refs = ($file =~ 
                                       /<a\s+           ## start of <a ...>
                                           href\s*=\s*  ## href attribute
                                           ['"]?        ## possible begin quote
                                           ([^'" >]+?)  ## URL of interest
                                           ["' ]?       ## possible end quote
                                        \s*>            ## end of tag
                                       /sigx 
                               );      

                       close F;
                       last;
                   }
                   foreach my $r (@refs) {
                           ## strip url arguments starting with # or ?
                       $r =~ s/[#?].*$//g;
                       next unless $r;

                           ## If relative url starting with /
                       if ($r =~ m#^/#) {
                           $r =  "http://$machine$r";
                       }
                           ## Else if relative url without /
                       elsif ($r !~ /^http:/) {
                           my ($prefix) = ($page =~ m#(.*)/# );
                           $r = "$prefix/$r";
                       }

                           ## push onto return list unless already seen
                           ## better:  'unless exists($titles{$r})'
                       push (@list, $r) unless grep ( /^$r$/, keys %titles );
                   }
                           ## Add to hash, so only process once.  
                           ## Value will be overwritten by title later.
                   @titles{@list} = undef;

                   return @list;
               }
                               

               sub usage {
                   print <<'EOF';

               site.pl walks the web of files starting with those listed in
               "infile", and makes a list of titles and urls.

               usage: site.pl [-h] [-m max] [-u u_prefix] [-f f_prefix] infile

               -h   help info
               max    maximum
               u_prefix and f_prefix are used to turn urls into file paths:
                       s/$u_prefix/$f_prefix/
               infile (or STDIN) should contain one starting urls per line.
                       
               EOF
                   exit;
               }
