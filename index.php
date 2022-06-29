<?php
    include 'autoload.php';
    if($_POST){
        echo $_POST['title'];
    }
    $page = isset($_GET["p"]) ? $_GET["p"] : "home";
    $sayfa = explode("/", $page);
    if($sayfa[0] == "home"){
        include "classes/View/index.php";
    }else{
        if(file_exists("classes/View/$sayfa[0].php")) {
            $handle = fopen("classes/View/$sayfa[0].php", "r");
            fclose($handle);
            if ($handle) {
                include "classes/View/$sayfa[0].php";
            }
        }else{
            echo "page not found";
        }
    }
?>

