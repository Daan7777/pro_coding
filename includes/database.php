<?php
$servername = "localhost";
$username = "stemapp";
$password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
$dbname = "pro_coding";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>