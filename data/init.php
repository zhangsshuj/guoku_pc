<?php
header("Content-Type:application/json;charset=utf-8");
#$conn = mysqli_connect(SAE_MYSQL_HOST_M, #SAE_MYSQL_USER, SAE_MYSQL_PASS,  SAE_MYSQL_DB, #SAE_MYSQL_PORT);
$conn= mysqli_connect('127.0.0.1','root','','guoku',3306);
mysqli_query($conn,'set names utf8');
function sql_execute($sql,$arr_type){
    global $conn;
    $result=mysqli_query($conn,$sql);
      return mysqli_fetch_all($result,$arr_type);
}
?>