<?php

// koneksi ke database

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'newskymedical';

mysql_connect($dbhost, $dbuser, $dbpass);
mysql_select_db($dbname);
?>