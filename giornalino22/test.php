<?php
require "database.php";

$username = isset($_POST['username']) ? $_POST['username'] : "";
$password = isset($_POST['password']) ? $_POST['password'] : "";

if(isset($_SESSION["id"])) {

    $sql = "SELECT categoria_Utente FROM utenti, account WHERE account.username = $username AND account.password = $password AND account.id_account = utenti.id_account";

$result = $conn->query($sql);

if ($result->num_rows > 0) {

while($row = $result->fetch_assoc()) {
}
    // $ruolo = 1

    if($categoria_Utente == 1) {
        // Pagina 1
    } else if($ruolo == 2) {
        // Pagina 2
    } else if($ruolo == 3{
        // Pagina errore
    }
} {
    // Non loggato
}
}
?>

'HTML'

<?php
$conn->close();
?>