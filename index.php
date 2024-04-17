<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sas Gyula</title>
    <link rel="stylesheet" href="stilus.css">
</head>
<body>
    <?php
    $nev = array("Nagy Tibor", "Szabó Klára", "Kovács Tóbiás", "Hofi Géza");
    $klub = array("Golf", "Póker", "Társas", "Gémer");
    $maxMeret = array();
    for ($i = 0; $i < 4; $i++){
        $maxMeret[$i] = (rand(10,100));
    }
    echo "
        <table>
            <tr>
                <th>Név</th>
                <th>Klub neve</th>
                <th>Maximális méret</th>
            </tr>
    ";
    for ($i = 0; $i < count($klub); $i++){
        echo "<tr>";
        echo "<td>$nev[$i]</td>";
        echo "<td>$klub[$i]</td>";
        echo "<td>$maxMeret[$i]</td>";
        echo "</tr>";
    }
    ?>
</body>
</html>