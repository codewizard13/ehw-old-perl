#!/usr/bin/perl
#
# Program:	ehgeturlparsepix.pl
# Creator:	Eric Hepperle
# Date:		08/29/01
#
# Purpose:	Rips HTML source code from a
#		web page, then lets you compare.
#		that one to subsequent rips of the
#		same page.  Differences are stored
#		in a text file.
#
##################################################


# This tells the script to use the WWW module
# (simplified).
#
use LWP::Simple;

print "\n";

print "This program gets the source code of any url entered.\n";
print "\n";

&mainsub;

&parsepix;

&arrycomp;

# Keep window open in dos mode
$hold = <STDIN>;







sub mainsub {

print "Enter a url to retrieve: ";
$url = <STDIN>;

print "\n";

print "Enter the name to give to the resulting html document: \n";
$docname = <STDIN>;
chomp $docname;

$docname = $docname.".html";
#$docname = "$docname\.html";

$file = get("$url");

print "The url is $url \n";
print "\n" ;

print "The contents of the url are: \n";
print $file;

print "\n";

print "The \$docname = $docname\n";
print "\n";


$dir = "/afs/rchland.ibm.com/usr3/v2cib484/ehtestdir";
$webfile = "$dir/$docname";



open (WEBDOC, ">$webfile") || die "cannot open output file $webfile \n";

    print WEBDOC "The following should be HTML! \n";

    # This is the line that prints the html source code to file.
    print WEBDOC $file;

close (WEBDOC);


#----------


sub parsepix {
# Open the file webdoc and parse for jpg or gif:
#
print "\n";
print "I will now open the saved html page \"$webfile\" and search for\n";
print "any jpg or gif file listings.\n";
print "";


open (WEBDOC, "$webfile") || die "cannot open output file $webfile \n";

    @webdoc = <WEBDOC>;

    print "---------------------------------------------\n";
    print "The text of the the html file $webfile is: \n";
    print "\n";

    # print the html source code to the screen.
    print (@webdoc);


    print "---------------------------------------------";
    print "\n";

    #@result = (@webdoc) =~ /jpg/;

    &arrycomp;



    print "\@result =\n";
    print (@result);

    print "\n";



close (WEBDOC);


}

}



sub arrycomp {

@result = (@webdoc) =~ /jpg/;

print "(@result)\n\n";


@array1 = (@result);

@array2 = @array1;

$count = 1;

while ($count <= 5){

   print ("element $count: $array1[$count - 1]\n");
   print ("$array2[$count - 1]\n");
   $count++;

}


}



sub elcount {

#@result

$wordcount = 0;

$line = <STDIN>;

while ($line ne "") {

   chop ($line);

   @array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;

}

print ("Total number of words: $wordcount\n");

}










@array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;








chop (@input);

# first, reverse the order of the words in each line

$currline = 1

while ($currline <= @input) {

   @words = split (/ /, $input[$currline - 1]);

   @words = reverse(@words);

   $input[$currline - 1] = join(" ", @words, "\n");

   $currline++;

}

# now, reverse the order of the input lines and print them

@input = reverse(@input);

print (@input);
