#/usr/local/bin/perl
print "Hello Cyberspace\n\n"

$INET->OpenURL($URL, "http://www.yahoo.com/");
 $bytes = $URL->QueryDataAvailable();
 $file = $URL->ReadEntireFile();
 $URL->Close();