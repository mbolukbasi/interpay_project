<?php
namespace Model;

class Author extends \Database
{
    private $name;

    public function getName(){
        return $this->name;
    }

    protected function getAuthors(){
        $query = 'SELECT * FROM authors';
        $send = $this->connect()->query($query);
        return (object) $send->fetchAll();
    }

    protected function getAuthorsByName($name){
        $query = "SELECT * FROM authors WHERE name='$name';";
        $send = $this->connect()->query($query);
        return $send->fetchAll();
    }

    protected function searchAuthorsByName($name){
        $query = "SELECT b.id AS book_id, a.name AS author_name, b.name AS book_name FROM authors AS a LEFT JOIN books AS b ON(a.id = b.author_id) WHERE a.name LIKE '%$name%';";
        $send = $this->connect()->query($query);
        return $send->fetchAll();
    }

    public function createAuthor($name){
        $query = "INSERT INTO authors (name) values(?) ON CONFLICT (name) DO UPDATE SET name='$name';";
        $send = $this->connect()->prepare($query);
        return $send->execute([$name]);
    }
}
