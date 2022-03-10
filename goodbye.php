<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <?php
    if (empty($_SESSION)) session_start();
    // print_r($_SESSION);
    // if (!empty($_SESSION)) session_destroy();

    header("refresh:20;url=./");
    $errorMessage = "";

    $vote = $_GET['kandidaat'];

    $servername = "localhost";
    $username = "stemapp";
    $password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
    $dbname = "pro_coding";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT id, entered, used, valid_from, valid_to FROM codes WHERE code=" . $_SESSION['code'];
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        // echo "entered: " . $row["entered"] . " - used: " . $row["used"];
        if (!empty($row["used"])) {
            $errorMessage = "code is al gebruikt";
            $conn->query("INSERT INTO misbruik(code_id) VALUES(" . $row["id"] . ")");
        } elseif (time() > strtotime($row["valid_to"])) $errorMessage = "code is niet meer geldig";
        else {
            // $_SESSION["code"] = $code;
            // header("Location: ./partij.php");
            session_destroy();
            $conn->query("UPDATE codes SET used = CURRENT_TIMESTAMP WHERE id = " . $row["id"]);
            $kandidaat = $conn->query("SELECT * FROM kandidaten WHERE id = " . $vote);
            if ($kandidaat->num_rows == 1) {
                $kandidaat = $kandidaat->fetch_assoc();
                $votes = $kandidaat["stemmen"];
                // echo $votes + 1;
                $conn->query("UPDATE kandidaten SET stemmen = " . ($votes+1) . " WHERE id = " . $vote);
            } else {
                $errorMessage = "kandidaat bestaat niet";
            }
        }
    } else {
        // echo "0 results";
        $errorMessage = "code bestaat niet";
    }
    $conn->close();

    ?>

    <p <?php if (!empty($errorMessage)) echo "style='color:red'" ?>>
        <?php 
            if (empty($errorMessage)) echo "Bedankt voor het ingeven van uw stem.";
            else echo $errorMessage;
        ?>
    </p>
    <div onclick="window.location.href = './';" class="progress">
        <span style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">Terug</span>
        <div class="progress__bar"></div>
    </div>
</body>

</html>