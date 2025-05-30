#!/usr/bin/perl
# File listinalist.eh.perl created by Eric Hepperle at 14:35:33 on Thu Apr 19 2001. 
#
# Assign a list as part of another list.
#


@innerlist = " never ";

@outerlist = ("I", @innerlist, "fail!\n");

print @outerlist;



