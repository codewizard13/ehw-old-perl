#!/usr/bin/perl -w

print "\n";

#print "What directory would you like to list out?";
#$dir = <STDIN>;

print "Listing C: recursively ...\n";
$dir = "\\\\machine_name\\and\\path";

&listdirectory($dir);

sub listdirectory
{
 local($dir);
 local(@lines);
 local($subdir);
 local($lvl_counter);
 local($list_length);

 $dir = $_[0];
 if(opendir (DIR, $dir))
 {
   @lines = readdir (DIR);
   closedir (DIR);
   $lvl_counter = 2;
   $list_length = ( scalar @lines );
   while ($lvl_counter < $list_length)
   {
      $subdir = $dir."\\".$lines[$lvl_counter];
      if(opendir (SUBDIR, $subdir))
      {
         closedir (SUBDIR);
         &listdirectory($subdir);
      }
      else
      {
         &processnames($subdir);
      }
      $lvl_counter++;
      }
   }
}

sub processnames {
$filecount++;
print ("$filecount $_[0]<br>");
}

#----------
$hold = <STDIN>;