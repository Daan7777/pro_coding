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

$sql = "SELECT * FROM partijen";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        
        ?>
        <table class="left"> <!-- partij links. -->
        <tr>
            <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
            <th class="table_tekst"> {Partij slogan} Lorem ipsum dolor sit amet, consectetur adipiscing elit. </th>
        </tr>
        <tr>
            <th> <a href="persoon.php" class="button"> <?php echo $row["naam"] ; ?></a> </th>
        </tr>
    </table>

    <?php
        
       
    }
} else {
    echo "0 results";
}

$conn->close();
?>