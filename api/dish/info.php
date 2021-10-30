<?php
require_once (dirname(__FILE__).'/../../functions.php');
require_once (dirname(__FILE__).'/../../connect to bd.php');

$url = ((!empty($_SERVER['HTTPS'])) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$str_id = stristr($url,"?id=",false);
$num = preg_replace('/[^0-9]/', '', $str_id);
if($num >= 1)
    $sql = "SELECT * FROM `dish` WHERE dish_ID = " . $num;
else
    $sql = "SELECT * FROM `dish`";
if (!getInfo($link,$sql))
    exit("Такого нет(");
echo json_encode(getInfo($link,$sql));
?>