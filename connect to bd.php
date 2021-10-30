<?php
    define('BD_NAME','olympiad');

    $link = mysqli_connect('localhost','root','',BD_NAME);

    if(mysqli_connect_errno())
        exit(mysqli_connect_error() . "<br>" . 'GG');
?>