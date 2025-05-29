#!/usr/bin/perl -w

print "\n";

# do this forever
for (;;)

{

# get information from user
print "Enter a word: ";

my $word1 = <STDIN>;

chomp $word1;

print "Enter a second word: ";

my $word2 = <STDIN>;

chomp $word2;

#----------

# perform basic string operations
if ($word1 eq $word2)

{

     print "The two words are equivalent.\n";

}

elsif ($word1 lt $word2)

{

     print "<$word1> is alphabetically less than <$word2>\n";

}

elsif ($word1 gt $word2)

{

     print "<$word1> is alphabetically greater than <$word2>\n";
     }

}


$hold = <STDIN>;