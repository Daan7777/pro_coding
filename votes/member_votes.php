<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Stemmen per kandidaat</h2>

<table>
  <tr>
    <th>ID</th>
    <th>Voornaam</th>
    <th>Achternaam</th>
    <th>Stemmen</th>
  </tr>
  <?php
    $servername = "localhost";
    $username = "stemapp";
    $password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
    $dbname = "vote";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT memberID AS id, memberFirstName AS firstName, memberLastName AS lastName, 
            (SELECT COUNT(*) FROM `vote` WHERE memberID = m.memberID) AS votes 
            FROM `member` AS m
            ORDER BY votes DESC;" ;
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) { 
            // var_dump( $row ) ;
            echo "<tr>";
            echo "    <td>".$row['id']."</td>";
            echo "    <td>".$row['firstName']."</td>";
            echo "    <td>".$row['lastName']."</td>";
            echo "    <td>".$row['votes']."</td>";
            echo "</tr>";
        }
    } else {
        echo "0 results";
    }
    $conn->close();
    ?>
</table>

</body>
</html>