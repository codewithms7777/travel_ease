<?php
session_start();
include "../db.php";

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit();
}

// Get statistics
$stats = [];

// Total bookings
$result = mysqli_query($conn, "SELECT COUNT(*) as total FROM bookings");
$stats['total_bookings'] = mysqli_fetch_assoc($result)['total'];

// Total revenue
$result = mysqli_query($conn, "SELECT SUM(total_amount) as revenue FROM bookings WHERE payment_status='paid'");
$row = mysqli_fetch_assoc($result);
$stats['total_revenue'] = $row['revenue'] ? $row['revenue'] : 0;

// Bookings by type
$bookings_by_type = mysqli_query($conn, "SELECT booking_type, COUNT(*) as count, SUM(total_amount) as revenue FROM bookings GROUP BY booking_type");

// Recent bookings (last 30 days)
$recent_bookings = mysqli_query($conn, "SELECT COUNT(*) as count FROM bookings WHERE booking_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)");
$stats['recent_bookings'] = mysqli_fetch_assoc($recent_bookings)['count'];

// Revenue by month (last 6 months)
$monthly_revenue = mysqli_query($conn, "SELECT DATE_FORMAT(booking_date, '%Y-%m') as month, SUM(total_amount) as revenue FROM bookings WHERE payment_status='paid' AND booking_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) GROUP BY month ORDER BY month DESC");

// Top destinations
$top_destinations = mysqli_query($conn, "SELECT details, COUNT(*) as bookings FROM bookings GROUP BY details ORDER BY bookings DESC LIMIT 10");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports & Analytics - TravelEase Admin</title>
    <link rel="stylesheet" href="../css/all.min.css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"> -->
    <link rel="stylesheet" href="admin-style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="admin-wrapper">
        <?php include 'sidebar.php'; ?>

        <main class="admin-main">
            <header class="admin-header">
                <h1><i class="fas fa-chart-bar"></i> Reports & Analytics</h1>
                <div class="header-actions">
                    <span>Welcome, <?php echo htmlspecialchars($_SESSION['admin_name']); ?></span>
                    <a href="../index.php" class="btn-secondary"><i class="fas fa-home"></i> View Site</a>
                </div>
            </header>

            <!-- Summary Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="stat-info">
                        <h3><?php echo number_format($stats['total_bookings']); ?></h3>
                        <p>Total Bookings</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                        <i class="fas fa-rupee-sign"></i>
                    </div>
                    <div class="stat-info">
                        <h3>₹<?php echo number_format($stats['total_revenue'], 0); ?></h3>
                        <p>Total Revenue</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="stat-info">
                        <h3><?php echo number_format($stats['recent_bookings']); ?></h3>
                        <p>Bookings (Last 30 Days)</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-info">
                        <?php
                        $total_users = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE role='user'");
                        $users_count = mysqli_fetch_assoc($total_users)['total'];
                        ?>
                        <h3><?php echo number_format($users_count); ?></h3>
                        <p>Total Users</p>
                    </div>
                </div>
            </div>

            <!-- Bookings by Type -->
            <div class="content-card">
                <h2>Bookings by Type</h2>
                <div class="table-responsive">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Travel Type</th>
                                <th>Total Bookings</th>
                                <th>Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row = mysqli_fetch_assoc($bookings_by_type)): ?>
                            <tr>
                                <td><span class="badge badge-info"><?php echo ucfirst($row['booking_type']); ?></span></td>
                                <td><?php echo number_format($row['count']); ?></td>
                                <td>₹<?php echo number_format($row['revenue'] ? $row['revenue'] : 0, 0); ?></td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Monthly Revenue -->
            <div class="content-card">
                <h2>Monthly Revenue (Last 6 Months)</h2>
                <div class="table-responsive">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Month</th>
                                <th>Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row = mysqli_fetch_assoc($monthly_revenue)): ?>
                            <tr>
                                <td><?php echo date('F Y', strtotime($row['month'] . '-01')); ?></td>
                                <td>₹<?php echo number_format($row['revenue'], 0); ?></td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Top Destinations -->
            <div class="content-card">
                <h2>Top Booked Destinations</h2>
                <div class="table-responsive">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Destination/Service</th>
                                <th>Number of Bookings</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row = mysqli_fetch_assoc($top_destinations)): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['details']); ?></td>
                                <td><?php echo number_format($row['bookings']); ?></td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

