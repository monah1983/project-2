<?php
require_once 'vendor/autoload.php';
use MyForm\QueryBuilder;
$db = new QueryBuilder();
$db->getAllTasks();