print ("Which file would you like to open?\n");

# REM: This is the actual test file:
# C:\EH Wordlists\ehproxylist1.txt

$count = 1;

$file2open = <STDIN>;


   open(FILE, "$file2open");

   @fileinfo = <FILE>;

   print $fileinfo[$count];

   $count = $count + 2;

close(FILE);



