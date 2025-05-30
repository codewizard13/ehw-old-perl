#!/usr/bin/perl

use strict;
use warnings;
use Cwd;

# usage:
#	FOR branchCheckout:
#
# 		buildRepo.pl <reponame> <localDir>
#
#	FOR branchUpdate:
#
#		updateRepo.pl <reponame>
#
#

# pass branch list as args:
my @branchArgs = ('qa1','qa2','qa3','qa4');


# foreach my $branch (@branchArgs) {
	# print "Arg: " . $branch . "\n"; 
# }

# record current directory so we can return here later
my $startDir = getcwd;

print "Current working directory: \n$startDir\n\n";

my $count = 1;
foreach my $branch (@ARGV)	 {
	print "Passed Arg $count: " . $branch . "\n"; 
	checkoutBranch($branch, $branch);
	$count++;
	system('cd $startDir');
}

print "Press any key to continue:";
<STDIN>;


#------------ SUBROUTINES --------------#

# C:\Users\eric.hepperle\Dropbox\BOOKIT DESKTOP DOCUMENTS\BOOKIT ERIC'S CODE\eric_perl

sub checkoutBranch {
	my $branch = @_[0];
	my $folder = @_[1];
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
	for (my $i = 0; $i < @repo; $i++) {
		system('svn co https://svn.bookit-dev.com/repos/' . $repo[$i] . '/branches/' . $branch . ' ./' . $dirs[$i] . '/');
		if ($? == -1) {
			print "$!\n";
		}
	}
}



