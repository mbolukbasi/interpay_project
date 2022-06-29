<?php
namespace Helper;
use Controller\AuhtorController;
use Controller\BookController;

class ReadFile
{
    public function xml($dir = 'files/'){
        $files = scandir($dir);
        foreach($files as $i => $file){
            if($i > 1){
                if(is_file($dir . $file)){
                    $xmldata = simplexml_load_file($dir . $file) or die("Failed to load");
                    foreach ($xmldata->book as $book) {
                        $author = new AuhtorController();
                        $author->create($book->author);

                        $bookObj = new BookController();
                        $bookObj->create($book->name, $author->findAuthorIdByName($book->author));
                    }
                    echo "<br> $dir$file  saved";
                }
                if(is_dir($dir . $file)){
                    $this->xml($dir . $file . '/');
                }
            }
        }
    }
}
