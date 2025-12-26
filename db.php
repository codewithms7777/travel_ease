


<?php
try {
    $conn = new PDO(
        "mysql:host=".$_ENV['MYSQLHOST'].";port=".$_ENV['MYSQLPORT'].";dbname=".$_ENV['MYSQLDATABASE'],
        $_ENV['MYSQLUSER'],
        $_ENV['MYSQLPASSWORD']
    );
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("DB Connection failed: " . $e->getMessage());
}
?>
