<?php
require_once (dirname(__FILE__).'/../../functions.php');
require_once (dirname(__FILE__).'/../../connect to bd.php');
$sql = "SELECT * FROM `orders`";
echo print_r(getInfo($link,$sql));
?>
