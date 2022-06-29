<?php

namespace Controller;

use Model\Book;

class BookController
{
    public function create($name, $author_id){
        $book = new Book();
        return $book->createBook($name, $author_id);
    }
}
