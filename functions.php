<?php
    function getInfo($link,$sql){
        $result = mysqli_query($link,$sql);
        /*echo '<pre>';
        echo var_dump($result);
        echo '</pre>';
        exit();*/
        $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $data;
    }

    function upDateUser($link){
        $sql = "UPDATE `user` SET `nickname` = 'update' WHERE `nickname` = 'testInsert'";
        mysqli_query($link,$sql);
    }

    function deleteUser($link){
        $sql = "DELETE FROM `user` WHERE `nickname` = 'update'";
        mysqli_query($link,$sql);
    }

    function insertUser($link){
        $sql = "INSERT INTO `user`(`nickname`, `role`) VALUES ('testInsert','player')";
        mysqli_query($link,$sql);
    }
?>
