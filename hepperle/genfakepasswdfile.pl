#!/usr/bin/perl
#
#
# Program:	genfakepasswdfile.pl
# Creator:	Eric Hepperle
# Date:	01/24/02
#
# Purpose:	Test script that generates a fake passwd file for testing.
#
###################################################
#
# Revisions:
#
#	- Original:  01/24/02
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called genfakepasswdfile.pl\n\n";

@namearray = (
	      [ "superman", "T", "t0001", "h0001", "Clark Kent,hero-01", "/hero/rchland.ibm.com/usr1/superman", "/bin/csh" ],
	      [ "hulk", "T", "t0002", "h0001", "Bruce Banner,hero-02", "/hero/rchland.ibm.com/usr3/hulk", "/bin/csh" ],
	      [ "catwoman", "T", "t0003", "v0001", "Selena Kyle,viln-01", "/vil/rchland.ibm.com/usr4/catwoman", "/bin/ksh" ],
	      [ "wolverine", "T", "t0004", "h0001", "Logan,hero-03", "/hero/rchland.ibm.com/usr5/wolverine", "/bin/csh" ],
	      [ "dracula", "T", "t0005", "v0001"; "Vlad Tsepesh,viln-02", "/vil/rchland.ibm.com/usr4/dracula", "/bin/ksh" ],
	      [ "blade", "T", "t0006", "h0001", "Spawn,hero-04", UNFINISHED ....!!!!
	      xena,
	      spawn,
	      daredevil,
	      spiderman
);


# TRACING:
$count = 1;
foreach $name (@namearray) {
   print "NAME[$count]:\t $name\n\n";

   # create hash table and store in memory.
   %hero;

   $hero{$count} = $name;

   $count++;
}

# passwd entry template:
#
# loadl:V:12901:1621:Marty Gustafson,738552-:/afs/rchland.ibm.com/usr5/loadl:/bin/csh
#


# let user choose how many names to generate.
print "How many fake passwd entries would you like to generate (1-10): ";
$qty = <STDIN>;
chomp $qty;
print "\n";

# assign new variable to hold the shuffled array.
@namesshuffled = @namearray;


# shuffle array in place randomly
# NOTE:		This sub taken directly from Perl FAQ 4.
#
sub shufflearray {

   $namesshuffled = shift;
   $i;
   for ($i = @$namesshuffled; --$i; ) {
      $j = int rand ($i+1);
      @$namesshuffled[$i,$j] = @$namesshuffled[$j,$i];
   }
}

# call shuffle sub.
shufflearray( \@namesshuffled );    # permutes @array in place


# TRACING:
$count = 1;
foreach $name (@namesshuffled) {
   print "NAME[$count]:\t $name\n\n";
   $count++;
}


# define passwd file entry template:
sub template {

   $name;T;$idnum;
}

@arr = (
                [ "perl", "rocks" ],
                [ "oh", "yeah" ],
                [ "hooray", "whoop!"],
       );
       print "$arr[1][1]\n";
