<?php
    function getInfo($link,$sql){
        $result = mysqli_query($link,$sql);
        $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $data;
    }

    function createOrder($link,$sql){
        mysqli_query($link,$sql);
    }
?>
