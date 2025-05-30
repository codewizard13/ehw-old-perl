#!/usr/bin/perl -w

print "\n";

use CGI;
$formpage = new CGI;
print $formpage->header;

# Get the form page parameter...
$category = $formpage->param ('favtype');

# ...and append it to the path.
$homedir = "\\\\machine_name\\and_path_to\\favorites\\$category";

# Output the start of a table and use
# the form parameter as a table title.
print '<style>TD{font-size : 12px; font-family : Arial;}</style>';
print '<body><center><table bordercolor="#666666" cellpadding=4';
print " cellspacing=0 border=1><tr><td bgcolor=#f0f0f0><b>Current ";
print "$category Links</b></td></tr><tr><td>";

# Do everthing to $homedir.
&listdirectory($homedir);

# Close the table.
print "</td></tr></table>";

# The 'Do Everything' Subroutine.
sub listdirectory
{
  local($dir);
  local(@lines);
  local($subdir);
  local($lvl_counter);
  local($list_length);
  
  # $dir = whatever was passed to this subroutine...
  $dir = $_[0];
  
  # ...which will open if it's a directory.
  if(opendir (DIR, $dir))
  {
  
    # Make a list of names in the directory...
    @lines = readdir (DIR);
    closedir (DIR);
    $lvl_counter = 2;
    $list_length = ( scalar @lines );

	
    # ...and add each name to $dir to constuct $subdir.
    while ($lvl_counter < $list_length)
    {
      $subdir = $dir."\\".$lines[$lvl_counter];
	  
      # Test the combined string for opening...
      if(opendir (SUBDIR, $subdir))
      {
        closedir (SUBDIR);
		
        # ...and pass the combined string to this subroutine.
        &listdirectory($subdir);
      }
	  
      # ...until it can go no further...
      else
      {
        # ...so process the path/filename.
        &processnames($subdir);
      }
      $lvl_counter++;
    }
  }
}

# The 'Process Names' subroutine.
sub processnames
{
  # $favstring = the name passed to this subroutine.
  $favstring = $_[0];
  if (open (FAVFILE, $favstring))
  {
    # Print a new heading from the path/filename.
    &makeheadings;

    # Prepare new hyperlink text from the path/filename.
    @hyperlinkparts = split(/\\/, $favstring);
    $hyperlinkparts_length = ( scalar @hyperlinkparts );
    $hyperlink = $hyperlinkparts[$hyperlinkparts_length-1];
    $hyperlink =~ s/.url//;
  
    @favlines = <FAVFILE>;
    close (FAVFILE);
	
    # Loop through the lines of the file.
    # and extract the URL.
    foreach $favline (@favlines)
    {
      if($favline =~ /^URL=http:/)
      {
        @urlbits = split('=http',$favline);
        print "<a href=\"http$urlbits[1]\" target=\"_blank\">";
        print "$hyperlink</a><br>";
      }
    }
  }
}

# The 'Make Headings' subroutine splits the string
# passed to it and just re-formats the line
sub makeheadings
{
  $newheading = $dir;  
  if ($oldheading ne $newheading)
  {
    @headingbits = split("favorites", $newheading);
  
    @title = split(/\\/, $headingbits[1]);
    $title_length = ( scalar @title );
    $titlecount = 1;
    print "<p><font size=2><b>";
    while ($titlecount < $title_length)
    {
      print "$title[$titlecount] ";
      $titlecount++;
      if ($titlecount < $title_length)
      {
        print " >> ";
      }
    }
    print "</b></font><br>";
    $oldheading = $newheading;
  }
}

#----------
$hold = <STDIN>;