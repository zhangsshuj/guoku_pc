/**
 * Created by Administrator on 2017/10/12 0012.
 */
$("#btn").click(function(e){
    e.preventDefault();
    var n=$("#uname").val();
    var p=$("#upwd").val();
    var uReg=/^[a-zA-Z0-9]{3,12}$/;
    var pReg=/^[a-zA-Z0-9]{3,8}$/;
    if(!uReg.test(n)){
        alert("您输入的用户名格式不正确,字母或数字3~8位");
        return;
    }
    if(!pReg.test(p)){
        alert("您输入的用户名格式不正确,字母或数字3~8位");
        return;
    }
    $.ajax({
        url:"data/login/login_do.php",
        type:"get",
        data:{uname:n,upwd:p},
        success:function(data){
            if(data.code>0){
                sessionStorage["uname"]=n;
                sessionStorage["uid"]=data.uid;
				setTimeout(function(){
					location.href="index.html";
				},3000)
                
            }else{
                alert(data.msg);
            }
        },
        error:function(data){
            alert("网络故障！")
        }

    })
})