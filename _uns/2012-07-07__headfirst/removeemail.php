<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Make Me Elvis - Remove Email</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<!-- TTTLE:   removeemail_p153_01.php
     DATE:    12/13/09
	 PURPOSE: Removes emails from mailing list, one at a time.

	 CREATOR: Head First PHP & MySQL (p.153)

	 NOTES:   12/13/09 - This is the PHP file that is called by
	           the corresponding html file.

-->

<?php

  $dbc = mysqli_connect('50webs.biz','ehtech09_elvis','LM7412K2','ehtech09_elvis')
   or die('Error connecting to MySQL server.');

  $email = $_POST['email'];

  $query = "DELETE FROM email_list WHERE email = '$email'";

  $result = mysqli_query($dbc, $query)
   or die('Error querying MySQL database.');

  echo 'Customer removed: ' . $email;

  mysqli_close($dbc);

?>

</body>
</html>












