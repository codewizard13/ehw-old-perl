&ReadParse(*FORM);
if ($FORM{'FUNCTION'} eq "ADD") {
open(FILE, "count.txt");
$number = <FILE>;
close(FILE);
$number++;
open(FILE, ">database/$number.txt");
print FILE "$FORM{'TheirName'}\n";
print FILE "$FORM{'Theiremail'}\n";
close(FILE);
open(FILE, ">count.txt");
print FILE $number;
close(FILE);
exit;
}
if ($FORM{'FUNCTION'} eq "READ") {
open(FILE, "database/$FORM{'Number'}.txt");
@namemail = <FILE>;
close(FILE);
print "$namemail[0]\n";
print "$namemail[1]\n";
exit;
}
