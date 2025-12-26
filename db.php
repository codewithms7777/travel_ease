<?php
$host = "localhost";
$user = "root";     // default for XAMPP
$pass = "";         // default empty
$dbname = "travelease";

// Create connection
$conn = mysqli_connect($host, $user, $pass, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
