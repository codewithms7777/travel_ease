<?php
$host = "mysql.railway.internal";
$user = "root";     // default for XAMPP
$pass = "woHJszezOFVPCwnqdmzQMFeLJTfzImqE";         // default empty
$dbname = "railway";

// Create connection
$conn = mysqli_connect($host, $user, $pass, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
