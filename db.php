<?php
$host = "turntable.proxy.rlwy.net";
$port = 6543; // ← USE YOUR ACTUAL PORT FROM RAILWAY
$user = "root";
$pass = "woHJszezOFVPCwnqdmzQMFeLJTfzImqE";
$dbname = "railway";

$conn = mysqli_connect($host, $user, $pass, $dbname, $port);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
