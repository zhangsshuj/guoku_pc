<?php
@$u=$_REQUEST["uname"];
@$p=$_REQUEST["upwd"];
require_once("../init.php");
$sql="select * from gk_user where uname='$u' and upwd='$p'";
$result=sql_execute($sql,MYSQLI_ASSOC);
if($result!=null){
    $uid=$result[0]["uid"];
    echo '{"code":1,"msg":"登录成功！","uid":'.$uid.'}';
}else{
    echo  '{"code":-1,"msg":"用户名和密码不正确！"}';
}
?>