<?php
session_start();
include "db.php";

// Get all active buses
$sql = "SELECT * FROM buses WHERE status='active' AND available_seats > 0 ORDER BY departure_date, departure_time";
$result = mysqli_query($conn, $sql);
$buses = [];
while($row = mysqli_fetch_assoc($result)) {
    $buses[] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Buses - TravelEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/all.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"> -->

    <style>
        .booking-container {
            max-width: 1400px;
            margin: 30px auto;
            padding: 20px;
        }
        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .page-header h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .buses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        .bus-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .bus-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }
        .bus-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }
        .bus-name {
            font-size: 1.3rem;
            font-weight: 700;
            color: #2c3e50;
        }
        .bus-number {
            color: #7f8c8d;
            font-size: 0.9rem;
            margin-top: 5px;
        }
        .bus-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #667eea;
        }
        .bus-route {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 20px 0;
        }
        .route-city {
            flex: 1;
        }
        .route-city h3 {
            font-size: 1.1rem;
            color: #2c3e50;
            margin-bottom: 5px;
        }
        .route-city p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        .route-arrow {
            margin: 0 20px;
            color: #667eea;
            font-size: 1.5rem;
        }
        .bus-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .detail-item i {
            color: #667eea;
            width: 20px;
        }
        .detail-item span {
            color: #2c3e50;
            font-size: 0.95rem;
        }
        .btn-book-bus {
            width: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s;
            text-decoration: none;
            display: block;
            text-align: center;
        }
        .btn-book-bus:hover {
            transform: translateY(-2px);
        }
        .no-results {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 12px;
        }
        .no-results i {
            font-size: 4rem;
            color: #bdc3c7;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <?php include 'includes/navbar.php'; ?>

    <div class="booking-container">
        <div class="page-header">
            <h1><i class="fas fa-bus"></i> Book Bus Tickets</h1>
            <p style="color: #7f8c8d;">Choose from available buses and book with ease</p>
        </div>

        <?php if(count($buses) > 0): ?>
            <div class="buses-grid">
                <?php foreach($buses as $bus): ?>
                    <div class="bus-card">
                        <div class="bus-header">
                            <div>
                                <div class="bus-name"><?php echo htmlspecialchars($bus['bus_name']); ?></div>
                                <div class="bus-number"><?php echo htmlspecialchars($bus['bus_number']); ?></div>
                            </div>
                            <div class="bus-price">₹<?php echo number_format($bus['price'], 0); ?></div>
                        </div>

                        <div class="bus-route">
                            <div class="route-city">
                                <h3><?php echo htmlspecialchars($bus['departure_city']); ?></h3>
                                <p><?php echo date('h:i A', strtotime($bus['departure_time'])); ?></p>
                                <p style="font-size: 0.85rem;"><?php echo date('M d, Y', strtotime($bus['departure_date'])); ?></p>
                            </div>
                            <div class="route-arrow">
                                <i class="fas fa-arrow-right"></i>
                            </div>
                            <div class="route-city" style="text-align: right;">
                                <h3><?php echo htmlspecialchars($bus['arrival_city']); ?></h3>
                                <p><?php echo date('h:i A', strtotime($bus['arrival_time'])); ?></p>
                                <p style="font-size: 0.85rem;"><?php echo date('M d, Y', strtotime($bus['arrival_date'])); ?></p>
                            </div>
                        </div>

                        <div class="bus-details">
                            <div class="detail-item">
                                <i class="fas fa-bus"></i>
                                <span><?php echo ucfirst(str_replace('_', ' ', $bus['bus_type'])); ?></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-users"></i>
                                <span><?php echo $bus['available_seats']; ?> Seats Available</span>
                            </div>
                        </div>

                        <a href="booking.php?type=bus&id=<?php echo $bus['id']; ?>" class="btn-book-bus">
                            <i class="fas fa-check"></i> Book Now
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="no-results">
                <i class="fas fa-bus"></i>
                <h2>No Buses Available</h2>
                <p style="color: #7f8c8d; margin-top: 10px;">Please check back later for available buses.</p>
            </div>
        <?php endif; ?>
    </div>

    <?php include 'includes/footer.php'; ?>
    <script src="js/script.js"></script>
</body>
</html>
