<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stemmen!</title>
    <link rel="stylesheet" href="styles.css">

    <?php
    if (empty($_SESSION)) session_start();
    // print_r($_SESSION);
    if (!empty($_SESSION)) session_destroy();
    
    function notHidden($var)
    {
        return !str_starts_with($var, ".");
    }

    $images = array_values(array_filter(scandir("welcome_images"), "notHidden"));
    ?>
</head>

<body>
    <p class="center uitleg">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac ante in odio pellentesque blandit ut eu libero. Nulla purus ex, semper viverra efficitur eu, ornare ut nisi. Aenean nec tellus rutrum, condimentum nibh in, condimentum urna. Pellentesque ut ultrices tortor. Cras varius nunc et volutpat fringilla. Ut volutpat sagittis ipsum, volutpat imperdiet orci suscipit id. Morbi vel dignissim ante, ut semper enim. Aliquam vitae viverra est, id dapibus ligula. Aliquam erat volutpat. Etiam bibendum pellentesque risus, id fringilla enim semper finibus. Morbi placerat aliquet ex id sagittis. Vivamus a odio pellentesque, venenatis massa ac, luctus mi. Donec gravida risus vitae sem molestie mattis. Praesent iaculis erat et mi scelerisque, vel commodo urna tristique. Fusce pulvinar tellus in ipsum scelerisque, nec rhoncus dui egestas.</p>
    <a class="start center" href="entercode.php">INLOGGEN</a>

    <script>
        const images = <?php echo json_encode($images); ?>;
        let i = 0;
        const setBackgroundImage = () => document.body.style.backgroundImage = `url(welcome_images/${images[i++%images.length]})`;
        setInterval(setBackgroundImage, 20 * 1000);
        setBackgroundImage();
    </script>
</body>

</html>