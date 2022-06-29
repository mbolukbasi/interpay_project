<?php
namespace Model;

class Book extends \Database
{
    public function createBook($name, $author_id){
        $query = "INSERT INTO books (name, author_id) values(?, ?)";
        $send = $this->connect()->prepare($query);
        return $send->execute([$name, $author_id]);
    }
}
