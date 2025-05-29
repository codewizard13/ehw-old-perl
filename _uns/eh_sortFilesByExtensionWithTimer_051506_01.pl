#!/usr/bin/perl
#
# Program:    eh_sortFilesByExtensionWithTimer_051506_01.pl
# Creator:    Eric Hepperle
# Date:       05/15/06
#
# Purpose:    Implements file sorting program on a timer.
#
# Requires:   * eh_sortFilesByExtension_051306_01.pl.
#
#
############################################################


############################################################
##################   INCLUDED MODULES:   ###################
############################################################

#require "eh_sortFilesByExtension_051306_01.pl";


############################################################
#################   MAIN CONTROL PROGRAM:   ################
############################################################

# Initialize Variables:
@test = ("dog", "cat", "319", "234-0908", "peanut",
           "smurf", "jerk", "special", "end");

# test require statement
#&print_array_list(@test);

system( `cmd explorer`);



############################################################
#####################   SUBROUTINES:   #####################
############################################################

# takes a file as an argument and executes file periodically.
sub timer {
   
}