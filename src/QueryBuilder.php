<?php


namespace MyForm;
use \PDO;
use \PDOException;

class QueryBuilder
{
    public $pdo;
    public $filename;

    function __construct()
    {
        //$this->pdo =new PDO($this->$dsn, $this->$db_user, $this->$db_pass);
        $this->pdo = new PDO("pgsql:host=192.168.100.219; dbname=default", "default", "secret");
    }
    //Список задач

/*    function upLoadImage ($image)  {
        $extension = pathinfo($image['name'], PATHINFO_EXTENSION);
        $filename = uniqid() . "." . $extension;
        move_uploaded_file($image['tmp_name'], "uploads/" . $filename);
        return $filename;
    }*/


    //Сохранение новой задачи
    function addTask ($firstName, $lastName, $thrName, $email, $address, $kurs, $faculty, $saveinfo, $whois, $zip, $image) {
        $statement = $this->pdo->prepare("INSERT INTO users (firstname, lastname, thrname, email, address, kurs, faculty, saveinfo, whois, zip, image) 
                    VALUES (:firstName, :lastName, :thrName, :email, :address, :kurs, :faculty, :saveinfo, :whois, :zip, :image)");
        $statement->bindValue(':firstName', $firstName, PDO::PARAM_STR);
        $statement->bindValue(':lastName', $lastName, PDO::PARAM_STR);
        $statement->bindValue(':thrName', $thrName, PDO::PARAM_STR);
        $statement->bindValue(':email', $email, PDO::PARAM_STR);
        $statement->bindValue(':address', $address, );
        $statement->bindValue(':kurs', $kurs, PDO::PARAM_INT );
        $statement->bindValue(':faculty', $faculty,PDO::PARAM_INT );
        $statement->bindValue(':saveinfo',$saveinfo,PDO::PARAM_INT );
        $statement->bindValue(':whois', $whois,PDO::PARAM_INT );
        $statement->bindValue(':zip', $zip, PDO::PARAM_STR);
        $statement->bindValue(':image', $image,  PDO::PARAM_STR);
        $statement->execute(); //true || false
        var_dump($this->pdo->lastInsertId('users_id_seq'));
    }
    // Вывод одной задачи
    function getTask($id) {
        $db_user = "default";
        $db_pass ="secret";
        $dsn = 'pgsql:host=192.168.100.198; dbname=default';
        $pdo = new PDO($dsn, $db_user, $db_pass);
        $statement = $pdo->prepare("SELECT * FROM tasks WHERE id=:id");
        $statement->bindParam(":id", $id);
        $statement->execute();
        return $statement->fetch(PDO::FETCH_ASSOC);
    }

    //Изменение/обновление существующей задачи
    function updateTask ($data) {
        $db_user = "default";
        $db_pass ="secret";
        $dsn = 'pgsql:host=192.168.100.198; dbname=default';
        $pdo = new PDO($dsn, $db_user, $db_pass);
        $sql = 'UPDATE tasks SET title=:title, content=:content WHERE id=:id';
        $statement = $pdo->prepare($sql);
        $statement->execute($data); // true || false
    }
    //Удаление задачи
    function deleteTask($id) {
        $db_user = "default";
        $db_pass ="secret";
        $dsn = 'pgsql:host=192.168.100.198; dbname=default';
        $pdo = new PDO($dsn, $db_user, $db_pass);
        $sql = 'DELETE FROM tasks WHERE id=:id';
        $statement = $pdo->prepare($sql);
        $statement->bindParam(":id", $id);
        $statement->execute();
    }
}