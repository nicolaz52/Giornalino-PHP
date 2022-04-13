<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>I miei Articoli</title>
  </head>
  <body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


    <head>
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
          <a class="navbar-brand">I MIEI ARTICOLI</a>   
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="btn btn-primary" href="scrivi.html" style="margin-right: 30px">+</a>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Hotkeys" aria-label="Search">
              <button type="button" class="btn btn-success">Search</button>
            </form>
          </div>
          <a class="btn-close" style="background-color: white;" href="verifier.php"></a>
        </div>
      </nav> 

      <?php
session_start();

        require("../conn.php");
        $autore = $_SESSION["autore"];

        $sql = "SELECT titolo, riassunto_articolo FROM articoli WHERE autore = $autore;";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {

            while($row = $result->fetch_assoc()) {
              $titolo = $row["titolo"];
              $riass = $row["riassunto_articolo"];
              echo "<div class='card' style='width: 50rem;'>";
                echo "<div class='card-body'>";  
                  echo "<h5 class='card-title'>$titolo</h5>";
                  echo "<p class='card-text'>$riass</p>";
                  echo "<a href='articolo.php?$autore' class='btn btn-primary'>Vai all articolo</a>";
                echo "</div>";
              echo "</div>";
            }         
        }
      ?>
    </head>
  </body>
</html>