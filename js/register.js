///**
// * Created by Administrator on 2017/10/8 0008.
// */
//(()=>{
//    var btn=document.getElementById("btn");
//
//    btn.onclick=function(e){
//        e.preventDefault();
//        var uname=document.getElementById("uname").value;
//        var upwd=document.getElementById("upwd").value;
//        var email=document.getElementById("email").value;
//        var unameReg=/^[a-zA-Z0-9]{3,8}$/;
//        var upwdReg=/^[a-zA-Z0-9]{3,8}$/;
//        if(!unameReg.test(uname)){
//            var n_span=document.getElementById("n_span").innerHTML="用户名格式不正确，字母或数字3~8位";
//            return;
//        }
//        if(!upwdReg.test(upwd)){
//            var p_span=document.getElementById("p_span").innerHTML="密码格式不正确，字母或数字3~8位";
//            return;
//        }
//        ajax("post","data/register.php","uname="+uname+"&upwd"+upwd+"&email"+email);
//        .then(data=>{
//                if(data.code>1){
//                    alert(data.msg);
//                }else{
//                    alert("网络故障");
//                }
//            })
//
//
//    }
//})()

(()=>{
	var result=true;
    $("input[name=uname]").blur(e=>{
        vali($(e.target),"data/register/vali.php");
    })
    
    function vali($txt,url){
        return new Promise(resolve=>{
            var $span=$txt.next();
            if($txt.val()==""){
                $span.removeClass("right").addClass("error")
                .text("不能为空");
                result=false;
            }else{
                $.get(url,$txt.attr("name")+"="+$txt.val())
                .then(data=>{
                        if(data==true) {
                            $span.removeClass("error")
                                .addClass("right").text("可用");
                            result = true;
                            resolve();
                        }else{
                    $span.removeClass("right")
                        .addClass("error").text("不可用");
                    result=false;
                        }
                    })
            }
        })
    }
    $("input[name=email]").blur(e=>{
        vali($(e.target),"data/register/vali.php");
    })

    function checkPwd(){
        var $upwd=$("input[name=upwd]"),
            $upwd2=$("#upwd2"),
            $span=$upwd2.next();
        if($upwd.val()!=$upwd2.val()){
            $span.addClass("error").text("两次输入的密码不一致!");
            result=false;
        }else{
            $span.removeClass("error").text("");
            result=true;
        }
    }
    $("input[name=upwd]").blur(checkPwd);
    $("#upwd2").blur(checkPwd);
    $("#form1").submit(e=>{
        e.preventDefault();
        Promise.all([
            vali($("input[name=uname]"),
                "data/register/vali.php"),
            vali($("input[name=email]"),
                "data/register/vali.php")
        ]).then(()=>{
            checkPwd();
            if(result){
                $.get("data/register.php",$("#form1").serialize())
                    .then(data=>{
                    alert(data.msg);
					location.href="login.html";
                })
            }
        })
    })
})()