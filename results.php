<!-- copy of ./votes/party_votes_column_chart.php -->


<html>

<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {
      'packages': ['corechart', 'bar']
    });
    google.charts.setOnLoadCallback(drawStuff);
    const sumValues = obj => Object.values(obj).reduce((a, b) => a + b);
    const sumFromArrayIndex = (array, index) => array.reduce((previousValue, currentValue) => previousValue + currentValue[index], 0);


    const oldVotes = [
      ["VVD", 2605],
      ["CDA", 6276],
      ["GROENLINKS", 1221],
      ["D66", 943],
      ["Seniorenpartij Schagen", 2920],
      ["Partij van de Arbeid (P.v.d.A.)", 1854],
      ["SP (Socialistische Partij)", 875],
      ["Wens4U (wij en Schagen voor u)", 628],
      ["JessLokaal", 2290],
      ["Duurzaam Schagen", 985],
    ];
    const oldVotesTotal = sumFromArrayIndex(oldVotes, 1);
    // console.log(oldVotesTotal);

    const newVotes = [
      <?php
      $servername = "localhost";
      $username = "stemapp";
      $password = "XA3OVAMe6ecI8a657OQ2VaRO6Ey6nO";
      $dbname = "vote";

      $conn = new mysqli($servername, $username, $password, $dbname);
      if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
      }

      $sql = "SELECT
              party.partyID AS id,
              party.partyname AS `name`,
              COUNT(vote.memberID) AS votes
            FROM
              party
            LEFT JOIN member ON party.partyID = member.partyID
            LEFT JOIN vote ON member.memberID = vote.memberID
            GROUP BY party.partyID";
      // ORDER BY votes DESC;";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
          // var_dump( $row ) ;
          echo "[\"" . $row['name'] . "\", " . $row['votes'] . "],\n";
        }
      } else {
        echo "0 results";
      }
      $conn->close();
      ?>
    ]
    const newVotesTotal = sumFromArrayIndex(newVotes, 1);
    // console.log(newVotesTotal);

    const graphData = oldVotes.map(a => {
      a[1] = a[1] / oldVotesTotal * 100;
      a[2] = newVotes.find(b => b[0] == a[0])?. [1] / newVotesTotal * 100 || 0;
      return a;
    }).sort((a, b) => (b[1] - b[2]) - (a[1] - a[2]));
    // console.log(graphData);

    function drawStuff() {

      var chartDiv = document.getElementById('chart_div');

      var data = google.visualization.arrayToDataTable([
        ['Partij', '2018', '2022'],
        ...graphData,
      ]);

      var options = {
        chart: {
          title: 'Stemmen voor partijen',
        },
        vAxis: {
          title: 'Percentage stemmen',
          titleTextStyle: {
            fontSize: 20,
            // bold: true,
            italic: true
          },
        },
        hAxis: {
          title: '',
          titleTextStyle: {
            fontSize: 25,
            bold: true,
            italic: false
          },
          textStyle: {
            fontSize: 15
          },
          // slantedText: true,
          // maxTextLines: 2,
        },
        // theme: 'maximized',
      };

      // var materialChart = new google.charts.Bar(chartDiv);
      // materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
      var classicChart = new google.visualization.ColumnChart(chartDiv);
      classicChart.draw(data, options);
    };
  </script>
</head>

<body>
  <div id="chart_div" style="width: 100%; height: 100%;"></div>
</body>

</html>