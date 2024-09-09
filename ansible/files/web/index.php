<!DOCTYPE html>
<html>
<head>
    <title>Insecure Cyb</title>
</head>
<body>

<h1>Welcome to Insecure.cyb!</h1>
<img src="https://www.eff.org/files/banner_library/http_warning.png">

<h2>We learn what it means to be not secure :) </h2>

    <?php
    // Enable error reporting for debugging
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Define your database credentials
    $servername = "172.30.0.15";
    $username = "sammy";
    $password = "FLAG-741852";
    $database = "users";

    // Create a connection to the database
    $conn = new mysqli($servername, $username, $password, $database);

    // Check the connection
    if ($conn->connect_error) {
        echo "<p>Error: Could not connect to the database</p>";
    } else {
        echo "<p>Connected to the database</p>";

        // Check if the form is submitted
        if (isset($_POST['login'])) {
            $searchTerm = $_POST['login'];

            // Create and execute the SQL query
            $sql = "SELECT information FROM users WHERE name LIKE '%" . $searchTerm . "%'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                // Output the data
                echo "<p>Search results:</p>";
                while ($row = $result->fetch_assoc()) {
                    echo "<p>" . $row['information'] . "</p>";
                }
            } else {
                echo "<p>No results found</p>";
            }
        }

        // Close the database connection
        $conn->close();
    }
    ?>

    <!-- HTML Form -->
    <form method="POST" action="">
        <label for="login">Login:</label>
        <input type="text" name="login" id="login" />
        <input type="submit" value="Search" />
    </form>
</body>
</html>
