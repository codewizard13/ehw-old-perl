#!/usr/bin/perl
my $branch = $ARGV[0];
my @dirs = ("lib", "bookit.com", "bookit.com/subdomains/from", "bookit.com/subdomains/extranet");
my $home = '/home/ehepperle/Documents/projects/';
for ($i = 0; $i < @dirs; $i++) {
	print "Updating: " . $branch . " -> " . $dirs[$i] . "\n";
	chdir ($home);
	chdir ($branch);
	chdir ($dirs[$i]);
	system ('svn up');
	if ($? == -1) {
		print "$!\n";
	}
}

