#!/usr/bin/perl
#
# Program:	listinalist.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Assign a list as part of another list.
#
###################################################


@innerlist = " never ";

@outerlist = ("I", @innerlist, "fail!\n");

print @outerlist;



