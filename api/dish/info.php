<?php
require_once (dirname(__FILE__).'/../../functions.php');
require_once (dirname(__FILE__).'/../../connect to bd.php');
$sql = "SELECT * FROM `dish`";
echo print_r(getInfo($link,$sql));
?>