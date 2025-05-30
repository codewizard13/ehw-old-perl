<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Make Me Elvis - Send Email</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<!-- TTTLE:   sendemail_p145_01.php
     DATE:    12/13/09
	 PURPOSE: Sends emails to all subcribers on mailing list.

	 CREATOR: Head First PHP & MySQL (p.145)

	 NOTES:   12/13/09 - This is the companion PHP file to
	           the original html file.

-->
<?php

  $from = 'webmaster@wolfstechnologytabernacle.com';
  $subject = $_POST['subject'];
  $text = $_POST['elvismail'];
  
  $dbc = mysqli_connect('50webs.biz', 'ehtech09_elvis', 'LM7412K2', 'ehtech09_elvis')
    or die('Error connecting to MySQL server.<br />');

  $query = "SELECT * FROM email_list";
  $result = mysqli_query($dbc, $query)
   or die('Error querying MySQL database.');
  
  while ($row = mysqli_fetch_array($result)) {
    $first_name = $row['first_name'];
	$last_name = $row['last_name'];

	$msg = "Dear $first_name $last_name,\n$text";
	$to = $row['email'];
	mail($to, $subject, $msg, 'From: ' . $from);
	echo 'Email sent to: ' . $to . '<br />';

  }

  mysqli_close($dbc);

?>

</body>
</html>












