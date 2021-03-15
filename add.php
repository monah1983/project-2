<?php
require_once 'vendor/autoload.php';
use MyForm\QueryBuilder;
$db = new QueryBuilder();
/*$db->upLoadImage($_FILES['image']);*/
$filename = upLoadImage($_FILES['image']);
$db->addTask($_POST['firstName'], $_POST['lastName'],$_POST['thrName'],$_POST['email'],$_POST['address'],
    $_POST['kurs'], $_POST['faculty'],$_POST['saveinfo'],$_POST['whois'], $_POST['zip'], $filename);
/*echo '<pre>';
var_dump($_FILES);
echo '</pre>';*/


function upLoadImage ($image)  {
    $extension = pathinfo($image['name'], PATHINFO_EXTENSION);
    $filename = uniqid() . "." . $extension;
    move_uploaded_file($image['tmp_name'], "uploads/" . $filename);
    return $filename;

}

/*echo '<pre>';
print_r($_POST);
echo '</pre>';*/
/*echo '<pre>';
print_r($db->getAllTasks());
echo '</pre>';*/