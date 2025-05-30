#!/usr/bin/perl
# @program: conflictChecker.pl
# @author:  Eric Hepperle
# @date:    03/23/12
#
# @purpose: Batch checking for svn (subversion) conflicts.
#
# @usage:
#
#			$> svnConflictChecker.pl <branch1> <branch2> <branch3> ... <branch(n)>
#
#			"branch" is a checked out branch residing on your local system, as a
#			direct child (subdir) of the current directory.
#
use strict;
use warnings;

# conflictChecker.pl
#
# pass the branches to check 
my $bi = 'bookit.com';
my $bsub = "$bi/subdomains";
my @localRepoPaths = ($bi, "$bsub/from", "$bsub/extranet", 'lib');

# @ARGV has our passed in branches

clearScreen();

#system('clear')
print "\n---- CHECKING FOR SVN CONFLICTS: -----\n\n";
foreach my $branch (@ARGV) {
	getSvnStatus($branch) or die ("ERROR: No branch was passed or the branch does not exist\n");
}



sub getSvnStatus {
	my $b = $_[0];
	foreach my $repoPath (@localRepoPaths) {
	  system('svn st ' . "./" . $b . "/" . $repoPath);
	  #print "svn st ./$b/$repoPath\n"
	}

	print "\n";
	print "\n";
	print "**************** COMPLETED CHECKING $b FOR CONFLICTS ********************\n\n";

}

sub getOpSys {
	my $os = $^O;
	return $os;
}

sub clearScreen {
	my $osEnvCode = lc(getOpSys());
	#print "\$osEnvCode: $osEnvCode\n";


	if (index( $osEnvCode, 'win') != -1) {
		# os is Windows
		system('cls');
		print "Os is Windows\n\n";

	} else {
		# os is Linux or Unix based
		system('clear');
		print "Os is Unix/Linux\n\n";
	}

}
