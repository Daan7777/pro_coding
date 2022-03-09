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
        <img src="./partij_logos/1.png" alt="cda logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/2.jpg" alt="seniorenpartij logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/3.png" alt="vvd logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/4.png" alt="jesslokaal logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/5.png" alt="pvda logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/6.png" alt="groenlinks logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/7.png" alt="d66 logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/8.png" alt="socialistischepartij logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>

    <div class="blok">
        <img src="./partij_logos/9.png" alt="wens4u logo " class="partij">
        <p class="rechts textright" maxlength="100"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
        <p> naam/button </p>
    </div>
</body>