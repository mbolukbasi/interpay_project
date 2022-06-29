<?php
namespace Controller;

use Model\Author;

class AuhtorController extends \Model\Author
{
    public function create($name){
        $author = new Author();
        return $author->createAuthor($name);
    }

    public function show(){
        $author = new Author();
        return $author->getAuthors();
    }

    public function findAuthorIdByName($name){
        $authors = new Author();
        $authorObj = $authors->getAuthorsByName($name);
        return $authorObj[0]['id'];
    }

    public function searchAuthorByName($name){
        $authors = new Author();
        $authorObj = $authors->searchAuthorsByName($name);
        return $authorObj;
    }
}
