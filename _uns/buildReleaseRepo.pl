#!/usr/bin/perl
my $branch = $ARGV[0];
my $folder = $ARGV[1];
my @repo = ("lib", "BookIt", "From", "Extranet");
my @dirs = ("lib", "bookit.com", "bookit.com/subdomains/from", "bookit.com/subdomains/extranet");
if ($folder eq "") {
	print "Building a branch for: " . $branch . "\n";
	mkdir "$branch" or die "Branch already exists.\n";
	chdir ($branch) or die "Unable to get to folder.\n";
} else {
	print "Building a branch of: " . $branch . " @ " . $folder . "\n";
	mkdir "$folder" or die "Branch already exists.\n";
	chdir ($folder) or die "Unable to get to folder.\n";
}
for ($i = 0; $i < @repo; $i++) {
	system('svn co https://svn.bookit-dev.com/repos/' . $repo[$i] . '/releases/' . $branch . ' ./' . $dirs[$i] . '/');
	if ($? == -1) {
		print "$!\n";
	}
}

