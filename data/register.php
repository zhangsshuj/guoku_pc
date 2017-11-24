<?php
header("Content-Type:text/plain;charset=UTF-8");
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
@$email=$_REQUEST["email"];
require_once("init.php");
$sql="insert into gk_user(uname,upwd,email) values
    ('$uname','$upwd','$email')";
$result=mysqli_query($conn,$sql);
if($result===true){
    echo '{"code":1,"msg":"sucess"}';
}else{
    echo '{"code":-1,"msg":'.$sql.'}';
}
?>