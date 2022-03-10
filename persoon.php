<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>partij!</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <!-- PHP dat je terugstuurd als je geen code hebt ingevuld. -->
    <?php
    if (empty($_SESSION)) session_start();
    // print_r($_SESSION);
    if (empty($_SESSION["code"])) header("Location: ./");
    ?>

    <!-- Terug knop + tekst. -->
    <div class="back left">
        <img src="./images/go_back.png" alt="go_back" style="width:50px;height:50px;">
        <a class="nodecoration big" href="partij.php">ga terug</a>
    </div>
    <div>
        <p class="top"> Kies de persoon waar u voor wilt stemmen. </p>
    </div>

    <!-- Database link -->
    <?php
    $servername = "localhost";
    $username = "stemapp";
    $password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
    $dbname = "pro_coding";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM kandidaten WHERE partij_id = " . $_GET['partij'] ;
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) { 
            // var_dump( $row ) ;
            $filename = "./images/kandidaten/".$row['id'].".jpg";
            $exists = file_exists($filename);
            if ($exists == false) $filename = "./images/persoon.png";
            echo "<div class='blok choose'>";
            echo "    <img src='" . $filename . "' alt='".$row['voornaam']." foto' class='partij'>";
            echo "    <a class='midden knop' href='goodbye.php?kandidaat=".$row['id']."'>".$row['voornaam'] . " " . $row['achternaam']."</a>";
            echo "</div>";
        }
    } else {
        echo "0 results";
    }
    $conn->close();
    ?>

<div class="back rightdown">
        <a class="nodecoration big" href="goodbye.php">Verzenden</a>
    </div>
</body>