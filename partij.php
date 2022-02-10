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
    <div> 
        <table class="left"> <!-- partij links. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
        <table class="right"> <!-- partij rechts. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
    </div>
    <div> 
        <table class="left"> <!-- partij links. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
        <table class="right"> <!-- partij rechts. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
    </div>
    <div> 
        <table class="left"> <!-- partij links. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
        <table class="right"> <!-- partij rechts. -->
            <tr>
                <th> <img src="images/avatar.jpg" class="logo" alt="avatar pic" width="200" height="200"> </th>
                <th> tekst naast foto. </th>
            </tr>
            <tr>
                <th> <a href="persoon.php" class="button"> button onder de foto</a> </th>
            </tr>
        </table>
    </div>
</body>

</html>