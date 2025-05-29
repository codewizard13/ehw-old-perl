#!/usr/bin/perl -w

print ("\n");

push (@myList, "Hello");
push (@myList, "People");
push (@myList, "how");
push (@myList, "are");
push (@myList, "you?");

while ($index = pop(@myList))

{
     print "popping off stack: $index \n";
     
}


$hold = <STDIN>