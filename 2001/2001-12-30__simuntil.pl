#!/usr/bin/perl
#
# Program:	simuntil.pl
# Creator:	Eric Hepperle
# Date:		10/24/01
#
# Purpose:	Uses an until loop to let user keep trying to enter the correct answer.  If the correct answer is input the program tells user the answer is correct and then abruptly ends.
#
############################################################

print ("what is 17 plus 26?\n");

$correct_answer = 43;		# the correct answer

$input_answer = <STDIN>;

chop ($input_answer);

until ($input_answer == $correct_answer) {

	print ("Wrong! Keep trying!\n");

	$input_answer = <STDIN>;

	chop ($input_answer);

}

print ("You've got it!\n");

