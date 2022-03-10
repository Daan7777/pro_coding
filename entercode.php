<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stemmen!</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <a style="position: absolute; color: transparent; padding: 50px; left: 0px; top: 0px;" href="./">terug</a>
    <?php
    if (empty($_SESSION)) session_start();
    // print_r($_SESSION);
    if (!empty($_SESSION)) session_destroy();
    $errorMessage = "";
    $code = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["code"])) {
            $errorMessage = "Code is verplicht.";
        } else {
            $code = test_input($_POST["code"]);
            if (!preg_match("/^[0-9']*$/", $code)) {
                $errorMessage = "Code mag alleen uit cijfers bestaan.";
            } elseif (strlen($code) != 8) {
                $errorMessage = "Code moet 8 cijfers lang zijn.";
            } else {
                $servername = "localhost";
                $username = "stemapp";
                $password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
                $dbname = "pro_coding";

                $conn = new mysqli($servername, $username, $password, $dbname);
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT id, entered, used, valid_from, valid_to FROM codes WHERE code=" . $code;
                $result = $conn->query($sql);

                // echo $result->num_rows;
                if ($result->num_rows == 1) {
                    $row = $result->fetch_assoc();
                    // echo "entered: " . $row["entered"] . " - used: " . $row["used"];
                    // echo time();
                    // echo "<br>";
                    // echo strtotime($row["valid_to"]);
                    if (!empty($row["used"])) {
                        $errorMessage = "code is al gebruikt";
                        $conn->query("INSERT INTO misbruik(code_id) VALUES(" . $row["id"] . ")");
                    } elseif (time() < strtotime($row["valid_from"])) $errorMessage = "code is nog niet geldig";
                    elseif (time() > strtotime($row["valid_to"])) $errorMessage = "code is niet meer geldig";
                    else {
                        $_SESSION["code"] = $code;
                        header("Location: ./partij.php");
                    }
                    if (empty($row["entered"])) $conn->query("UPDATE codes SET entered = CURRENT_TIMESTAMP WHERE id = " . $row["id"]);
                } else {
                    // echo "0 results";
                    $errorMessage = "code bestaat niet";
                }
                $conn->close();
            }
        }
    }

    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    ?>

    <p class="center uitleg bold">Voer hier de 8 cijferige code in die je van meneer Oldenhof via de mail hebt gekregen.</p>
    <form class="center" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input id="code_input" name="code" type="number" placeholder="Code" autocomplete="off" autofocus><br>
        <input id="submit" type="submit" value="checken" disabled>
    </form>

    <div id="errorModal" class="modal" <?php if (!empty($errorMessage)) echo 'style="display:block;"' ?>>
        <div class="modal-content">
            <span class="close">&times;</span>
            <p><?php echo $errorMessage ?></p>
        </div>
    </div>

    <script>
        const input = document.getElementById('code_input');
        const submit = document.getElementById('submit');

        function onUserInactivity() {
            window.location.href = "./"
        }
        let inactivityTimeout;

        function resetTimeout() {
            // console.log('reset')
            // alert('hallo?')
            clearTimeout(inactivityTimeout)
            inactivityTimeout = setTimeout(onUserInactivity, 2 * 60 * 1000)
        }
        window.onload = resetTimeout;
        window.onscroll = resetTimeout;

        input.addEventListener('input', e => {
            if (input.value.length == 8) {
                submit.removeAttribute('disabled');
            } else {
                submit.setAttribute('disabled', '');
            }
            resetTimeout()
        });

        var modal = document.getElementById("errorModal");
        var span = document.getElementsByClassName("close")[0];
        span.onclick = () => {
            modal.style.display = "none";
        }
        window.onclick = e => {
            if (e.target == modal) {
                modal.style.display = "none";
            }
            resetTimeout()
        }
    </script>
</body>

</html>