<?php
$host = getenv('MYSQLHOST');
$port = getenv('MYSQLPORT');
$user = getenv('MYSQLUSER');
$pass = getenv('MYSQLPASSWORD');
$dbname = getenv('MYSQLDATABASE');

$conn = mysqli_connect($host, $user, $pass, $dbname, $port);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
