<?php

if($sayfa[1] == 'search') {
    $body = file_get_contents("php://input");
    $object = json_decode($body, true);
    if ($object) {
        $author = new \Controller\AuhtorController();
        $result = $author->searchAuthorByName($object['keyword']);
        echo json_encode($result);
    }
}
