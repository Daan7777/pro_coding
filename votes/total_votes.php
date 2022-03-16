<?php
$servername = "localhost";
$username = "stemapp";
$password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
$dbname = "vote";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT COUNT(*) FROM `vote`;";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$votes =  $row['COUNT(*)'];

$conn->close();
?>

<h1>Total votes: <?php echo $votes; ?></h1>