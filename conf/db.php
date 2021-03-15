<?php

/**
** Класс конфигурации базы данных
*/
class DB
{

    const USER = "default";
    const PASS = 'secret';
    const HOST = "192.168.100.219";
    const DB = "default";

    public static function connToDB()
    {

        $user = self::USER;
        $pass = self::PASS;
        $host = self::HOST;
        $db = self::DB;

        $conn = new PDO("pgsql:dbname=$db;host=$host,charset=UTF8", $user, $pass);
        return $conn;

    }
}