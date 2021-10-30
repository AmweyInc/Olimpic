<?php
require_once (dirname(__FILE__).'/../../functions.php');
require_once (dirname(__FILE__).'/../../connect to bd.php');

echo '<pre>';
echo 'Вветиде данные в таком виде:?sum=сумма заказа,phone=номер телефона,name=имя заказчика,institution=айди заведения';
echo '</pre>';
$url = ((!empty($_SERVER['HTTPS'])) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$str = stristr($url,"?sum=",false);
$str_sum = stristr($str,",",true);
$sum = preg_replace('/[^0-9]/', '', $str_sum);
if($sum < 1 && $sum != null)
    exit('Не верное значение суммы');
$str = stristr($url,"phone=",false);
$str_phone = stristr($str,",",true);
$phone = preg_replace('/[^0-9]/', '', $str_phone);
$str = stristr($url,"name=",false);
$str_name = stristr($str,",",true);
$str = stristr($url,"institution=",false);
$ins = preg_replace('/[^0-9]/', '', $str);
$name =  ltrim($str_name,"name=");

echo ' institution ' . $ins . '  name ' . $name . ' phone ' . $phone . ' sum ' . $sum;
if(sum != null) {
    $sql = "INSERT INTO orders (`sum`, `phone`, `name` , `institutionOrdersID`) VALUES ( "."'$sum','$phone','$name','$ins')";
    createOrder($link, $sql);
}
?>