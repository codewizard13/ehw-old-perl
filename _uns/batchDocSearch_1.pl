#!/usr/bin/perl
# @program: batchDocSearch.pl
# @author:  Eric Hepperle
# @date:    03/28/12
#
# @purpose: Search a batch of files for a particular text string.
#
# @usage:
#
#	CURRENT ALLOWED CONSTRUCT:
#	$> batchDocSearch.pl <file containing file list>
#
#	FUTURE CONSTRUCT WILL ALLOW THIS:
#	$> batchDocSearch.pl -m (<file1> <file2> <file3> ... <file(n)>) -s <searchterm>
#	The -m switch tells the
#	
#
use strict;
use warnings;

my $fileListPath = '.';
my $search = '';

clearScreen();

# $ARGV[0] has our fileList file
if (@ARGV == 0) {
    $fileListPath = "No file list path provided.\n\n";
    exit;
} else {
    $fileListPath = $ARGV[0];
}

# $ARGV[1] has our search term
if (!$ARGV[1]) {
   print "You need to enter a search term as the second argument.  Try again.\n\n";
   exit;
} else {
   $search = $ARGV[1];
}

print "\$ARGV[0] = \$fileListPath = $fileListPath\n\n";

my @myList = getFileContents($fileListPath);
my $bar = "-" x 72;

my $lineCount = 0;


print "\n$bar\n";
foreach my $filePath (@myList) {
   print "line $lineCount: $filePath\n";
   
   #$fileContents = getFileContents($filePath);
   my @fileContents = getFileContents($filePath);

   if (@fileContents =~ /((\S+\s+){0,4})($search)((\s+\S+){0,4})/i) {
      print "\t\t\tFound matches !!!\n";
       my ($pre, $match, $post) = ($1, $3, $4);
       print "FILE: $filePath\n";
       print "\nMATCHES:\n\n";
       print "$pre\n$match\n$post\n";       
       
   }

   
   print "\n$bar\n";   
   $lineCount++;
}

exit;

sub searchWithContext {}
      
sub getFileContents {
   my $filePath = $_[0];

   open(FILE, $filePath) or die "Can't read file $filePath [$!]\n";  
   my @document = <FILE>; 
   close (FILE);  
   return @document;

}

sub getOpSys {
	my $os = $^O;
	return $os;
}d

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
