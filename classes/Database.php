<?php


class Database
{
    private $host = 'localhost';
    private $user = 'postgres';
    private $password = '123';
    private $db = 'interpay';
    private $port = '5432';

    protected function connect() {
        $string = 'pgsql:host='.$this->host.';dbname='.$this->db.';port='.$this->port;
        $pdo = new PDO($string, $this->user, $this->password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        return $pdo;
    }
}
