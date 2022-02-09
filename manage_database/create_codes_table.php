<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pro_coding";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// sql to create table
$sql = "CREATE TABLE `codes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`code` VARCHAR(8) NOT NULL COLLATE 'latin1_swedish_ci',
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`valid_from` DATETIME NOT NULL,
	`valid_to` DATETIME NOT NULL,
	`entered` DATETIME NULL DEFAULT NULL,
	`used` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `code` (`code`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;";

if ($conn->query($sql) === TRUE) {
  echo "Table codes created successfully";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?>