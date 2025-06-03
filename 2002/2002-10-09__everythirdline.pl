#!/usr/bin/perl


#
# Program:		everythirdline.pl
# Creator:		Eric Hepperle
# Date:			10/09/02
# 
# Purpose:		To convert every three lines into one
#				CSV-Formatted line.

print "\n\n";

# Initialize separator var:
$separator = " ";

# Get filename from user:
print "ENTER THE FILE TO CONVERT:\n\n";
$file2conv = <STDIN>;
chomp $file2conv;

# Open specified file and read into an array:
open (FL2CON, "$file2conv");

# assign file to an array:
@file = <FL2CON>;

	# Initialize count variable:
	$count = 1;

	# Define new csv file name:
	$newfile = "$file2conv\.csv";
	#
	print "New file name is:  $newfile\n\n";
	$hold = <STDIN>;

	# Open new file for writing:
	open (CSVFL, ">$newfile");
	


	# Read each element in the array:
	foreach $line (@file)
	{

		# Remove newline char from $line:
		chomp $line;

		# Display line to screen:
		print "EL $count:  $line\n";

		# Separate every three elements with spaces,
		# but concat a line return at the end of the
		# three el sequence:

		# Create remainder varible:
		$divby3 = ( $count/3 );
		print "COUNT_DIVBY3:		$divby3\n";
		$remainder = $count % 3;
		print "REMAINDER:		$remainder\n\n";


		if ($remainder == 0)
		{
			$separator = "\n";
		} else {
			$separator = ", ";
		}
			

		# print line to csv file:
		print CSVFL "$line$separator";
		

		# Increment count by 1:
		$count = $count + 1;

		#$hold = <STDIN>;
	}



	close (CSVFL);

close (FL2CON);


#while ($line ne "") {

#     print ($line);

#     $line = <MYFILE>;

#}







#---------
$hold = <STDIN>;