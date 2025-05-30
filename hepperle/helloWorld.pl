#!/usr/bin/perl

use strict;
use warnings;

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

my $count = 1;
foreach my $branch (@ARGV)	 {
	print "Passed Arg $count: " . $branch . "\n"; 
	checkoutBranch($branch, $branch);
	$count++;
}

print "\nPress any key to continue:";
<STDIN>;


#------------ SUBROUTINES --------------#

# C:\Users\eric.hepperle\Dropbox\BOOKIT DESKTOP DOCUMENTS\BOOKIT ERIC'S CODE\eric_perl

sub checkoutBranch {
	my @myArgs = @_;
	my $branch = $myArgs[0];
	my $localDir = $myArgs[1];
	my @repo = ("lib", "BookIt", "From", "Extranet");
	my @dirs = ("lib", "bookit.com", "bookit.com/subdomains/from", "bookit.com/subdomains/extranet");
	if ($localDir eq "") {
			print "Building a branch for: " . $branch . "\n";
			mkdir "$branch" or die "Branch already exists.\n";
			chdir ($branch) or die "Unable to get to folder.\n";
	} else {
			print "Building a branch of: " . $branch . " @ " . $localDir . "\n";
			mkdir "$localDir" or die "Branch already exists.\n";
			chdir ($localDir) or die "Unable to get to folder.\n";
	}
	for (my $i = 0; $i < @repo; $i++) {
			system('svn co https://svn.bookit-dev.com/repos/' . $repo[$i] . '/branches/' . $branch . ' ./' . $dirs[$i] . '/');
			if ($? == -1) {
					print "$!\n";
			}
	}        
}


