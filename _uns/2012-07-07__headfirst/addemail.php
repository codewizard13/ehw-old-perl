<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Make Me Elvis - Add Email</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
  <h2>Make Me Elvis - Add Email</h2>
<!-- TTTLE:   addemail_p128_01.php
     DATE:    12/13/09
	 PURPOSE: Adds subscribers name and email to
	           "Make Me Elvis" email list.

	 CREATOR: Head First PHP & MySQL (p.128)

	 NOTES:   12/13/09 - Companion PHP script to main html input page.

-->

<?php

  // NOTE: The part in parentheses after "mysqli_connect"
  //  all has to be on the same line for the query to work.
  $dbc = mysqli_connect('50webs.biz', 'ehtech09_elvis', 'LM7412K2', 'ehtech09_elvis')
    or die('Error connecting to MySQL server.<br />');

  $first_name = $_POST['firstname'];
  $last_name = $_POST['lastname'];
  $email = $_POST['email'];

  $query =
   "INSERT INTO email_list " .
   "(first_name,last_name,email) " .
   "VALUES ('$first_name','$last_name','$email')";

  $result = mysqli_query($dbc, $query)  // 12/13/09, 01:13 -
                                        //  added "$result ="
   or die ('Error querying MySQL database.');

  mysqli_close($dbc);

  echo 'Customer added: ';
  echo "$first_name $last_name<BR />"; // 12/13/09, 01:10 -
                                      //  This line added by me.

?>


</body>
</html>












