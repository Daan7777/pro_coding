<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stemmen!</title>
    <link rel="stylesheet" href="./assets/styles.css">

    <?php
    if (empty($_SESSION)) session_start();
    // print_r($_SESSION);
    if (!empty($_SESSION)) session_destroy();

    function notHidden($var)
    {
        return $var[0] != ".";
    }

    $images = array_values(array_filter(scandir("images/welcome"), "notHidden"));
    ?>

</head>

<body>
    <div class=" right">
        <a class="nodecoration big" href="./results.php">statistics</a>
    </div>
    <p class="center uitleg bold shadow">Welkom bij de stemdoos.<br>Druk op "inloggen" om verder te gaan.</p>
    <a class="start center" href="entercode.php">Inloggen</a>
    <script>
        const images = <?php echo json_encode($images); ?>;
        let i = 0;
        const setBackgroundImage = () => document.body.style.backgroundImage = `url(images/welcome/${images[i++%images.length]})`;
        setInterval(setBackgroundImage, 20 * 1000);
        setBackgroundImage();
    </script>
</body>

</html>