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
    <?php
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
                // check the code in the database
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

                $sql = "SELECT id, entered, used FROM codes WHERE code=" . $code;
                $result = $conn->query($sql);

                echo $result->num_rows;
                if ($result->num_rows == 1) {
                    // output data of each row
                    $row = $result->fetch_assoc();
                    echo "entered: " . $row["entered"] . " - used: " . $row["used"];
                    if (!empty($row["used"])) $errorMessage = "code is al gebruikt";
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

    <p class="center uitleg">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac ante in odio pellentesque blandit ut eu libero. Nulla purus ex, semper viverra efficitur eu, ornare ut nisi. Aenean nec tellus rutrum, condimentum nibh in, condimentum urna. Pellentesque ut ultrices tortor. Cras varius nunc et volutpat fringilla. Ut volutpat sagittis ipsum, volutpat imperdiet orci suscipit id. Morbi vel dignissim ante, ut semper enim. Aliquam vitae viverra est, id dapibus ligula. Aliquam erat volutpat. Etiam bibendum pellentesque risus, id fringilla enim semper finibus. Morbi placerat aliquet ex id sagittis. Vivamus a odio pellentesque, venenatis massa ac, luctus mi. Donec gravida risus vitae sem molestie mattis. Praesent iaculis erat et mi scelerisque, vel commodo urna tristique. Fusce pulvinar tellus in ipsum scelerisque, nec rhoncus dui egestas.</p>
    <form class="center" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input id="code_input" name="code" type="number" placeholder="Code" autocomplete="off"><br>
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

        input.addEventListener('input', e => {
            if (input.value.length == 8) {
                submit.removeAttribute('disabled');
            } else {
                submit.setAttribute('disabled', '');
            }
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
        }
    </script>
</body>

</html>