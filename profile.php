<?php
session_start();
include "db.php";

// Redirect if not logged in
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

// Get user details from database
$user_id = $_SESSION['user_id'];
$sql = "SELECT * FROM users WHERE id = '$user_id'";
$result = mysqli_query($conn, $sql);
$user = mysqli_fetch_assoc($result);

// Update profile logic here
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - TravelEase</title>
    <!-- Add your CSS links here -->
</head>
<body>
    <!-- Include your navbar -->
    
    <div class="profile-container">
        <h1>Welcome, <?php echo htmlspecialchars($user['full_name']); ?></h1>
        
        <div class="profile-info">
            <h3>Personal Information</h3>
            <p><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></p>
            <p><strong>Phone:</strong> <?php echo htmlspecialchars($user['phone']); ?></p>
            <a href="edit-profile.php" class="btn">Edit Profile</a>
        </div>
        
        <div class="recent-bookings">
            <h3>Recent Bookings</h3>
            <!-- Display bookings here -->
        </div>
    </div>
    
    <!-- Include your footer -->
</body>
</html>