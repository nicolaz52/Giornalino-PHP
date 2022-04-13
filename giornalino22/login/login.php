<?php
    session_start();

    
    require("../conn.php");
   $Username = $_POST['username'];
   $Password = $_POST['pass'];

   $sql = "SELECT categoria_Utente, id_utente FROM utenti, account WHERE utenti.id_account = account.id_account AND username = '$Username' AND password = '$Password';";

   


   $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        while($row = $result->fetch_assoc()) {

            echo "id: " . $row["categoria_Utente"]. "<br>"; 
            $categoria_Utente = $row["categoria_Utente"];
            $utente = $row["id_utente"];
            $_SESSION["autore"] = $utente;
            // $categoria_Utente = $prova['categoria_Utente'];

            if($categoria_Utente == 1) {
                header("location: /giornalino/writer/page_writer.php");
            } else if($categoria_Utente == 2) {
                header("location: /giornalino/verifier/page_verifier.php");
            } else if($categoria_Utente == 3){
                header("location: /giornalino/AccManager/page_AccManager.php");
            }
        }   
    }
    else 
    {
    header("location: /giornalino/index.php");
    }
?>