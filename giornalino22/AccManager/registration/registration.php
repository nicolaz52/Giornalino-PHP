<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "giornalino";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $Name = $_POST['first_name'];
    $Cognome = $_POST['last_name'];
    $Ruolo = $_POST['role'];
    $Username = $_POST['Username'];
    $Password = $_POST['Password'];
    $Email = $_POST['Email'];


    $sql = "INSERT INTO account (username, password) VALUES ('$Username', '$Password')";

    if ($conn->query($sql) === TRUE) 
    {
        echo "New record created successfully";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    if($Ruolo === 'writer')
    {
        $role = 1;
    }
    else if($Ruolo === 'verifier')
    {
        $role = 2;
    }

    $sql = "SELECT id_account FROM account WHERE username = '" . $Username . "' AND password = '" . $Password . "'";

    $result = $conn->query($sql);

    $riga = mysqli_fetch_array($result);

    $prova = $riga['id_account'];

    $sql = "INSERT INTO utenti (nome, cognome, email, categoria_Utente, id_account) VALUES ('$Name', '$Cognome', '$Email', '$role', '$prova')";

    header("location: /giornalino/page_AccManager.html");
    
    $conn->query($sql);
?>