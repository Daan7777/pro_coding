<?php include('includes/database.php'); ?>

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
    <div>
        <a class="back" href="entercode.php">terug knop</a>
    </div>
    <div>
        <p class="top"> Kies de partij waar u voor wilt stemmen. </p>
    </div> 



    <div class="blok">
        <img src="./partij_logo's/vvd_logo.png" alt="vvd logo " class="vvd">
        <p> tekst </p>
    </div>
</body>