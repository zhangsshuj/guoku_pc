/**
 * Created by Administrator on 2017/10/23 0023.
 */
//多点轮播
(()=>{
    var bannerImgs=$("[data-load=bannerImgs]")[0],
        bannerInds=$("[data-load=bannerInds]")[0],
        n=0,LIWIDTH=1140,TRANS=300,INTERVAL=2000,
        timer=null;
		/*ajax("get","data/01-index/banners.php")
	    .then(data=>{
	      var banners=[...data];
	  console.log(banners);
		}) */
       
		$.ajax({
            type:"get",
            url:"data/index_banner.php",
            success:function(data){
				var banners=[...data];
				banners.push(banners[0]);
				console.log(banners);
				var strImgs="";
				var detailUrl="articles_details.html?rid=";
				 for(var img of banners){
				strImgs+=
				  `<li>
					<a href="${detailUrl+img.rid}">
					  <img src="${img.pic}">
					</a>
				  </li>
					
				`
				
				 }
				 var strInds="<li></li>".repeat(banners.length-1);
				 bannerImgs.innerHTML=strImgs;
				bannerImgs.style.width=banners.length*LIWIDTH+"px";
				  bannerInds.innerHTML=strInds;
				  bannerInds.children[0].className="hover";
				  
				   
            }
			//return new Promise(resolve=>resolve());  
        })
		.then(()=>{
			function moveOnce(){
				n++;
				var left=LIWIDTH*n;
				bannerImgs.style.left=-left+"px";
				bannerInds.children[n-1].className="";
				if(n==bannerImgs.children.length-1){
					bannerInds.children[0].className="hover";
					setTimeout(()=>{  
						bannerImgs.style.transition="";
						bannerImgs.style.left=0;
						n=0;
						setTimeout(()=>{
						  bannerImgs.style.transition=
							"all ."+TRANS/100+"s linear";
						},100);
					  },TRANS);
				}else{
					 bannerInds.children[n].className="hover";
				}
				  
			}
			timer=setInterval(moveOnce,INTERVAL+TRANS);
			 return new Promise(resolve=>resolve(moveOnce));

		})
		.then((moveOnce)=>{
			  bannerImgs.parentNode.onmouseover=function(){
				clearInterval(timer);
				timer=null;
			  }
			  bannerImgs.parentNode.onmouseout=function(){
				timer=setInterval(moveOnce,INTERVAL+TRANS);
			  }
			  for(let i=0;i<bannerInds.children.length;i++){
				bannerInds.children[i].onclick=function(){
				  n=i;
				  bannerImgs.style.left=-n*LIWIDTH+"px";
				  bannerInds.find(".hover")[0].className="";
				  bannerInds.children[i].className="hover";
				}
			  }
			  $("[data-move=left]")[0].onclick=function(e){
        e.preventDefault();
        if(n>0){
          n--;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          bannerInds.children[n+1].className="";
          bannerInds.children[n].className="hover";
        }else{
          bannerImgs.style.transition="";
          n=bannerImgs.children.length-1;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          setTimeout(()=>{
            bannerImgs.style.transition=
              "all ."+TRANS/100+"s linear";
            n--;
            bannerImgs.style.left=-n*LIWIDTH+"px";
            bannerInds.children[0].className="";
            bannerInds.children[n].className="hover";
          },100)
        }
      }
      $("[data-move=right]")[0].onclick=function(e){
        e.preventDefault();
        if(n<bannerInds.children.length-1){
          n++;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          bannerInds.children[n-1].className="";
          bannerInds.children[n].className="hover";
        }else{
          n++;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          bannerInds.lastElementChild.className="";
          bannerInds.firstElementChild.className="hover";
          setTimeout(()=>{
            bannerImgs.style.transition="";
            bannerImgs.style.left=0;
            n=0;
            setTimeout(()=>{
              bannerImgs.style.transition=
                "all ."+TRANS/100+"s linear";
            },100)
          },TRANS)
        }
      }
		
	}).catch(err=>console.log(err))
})();

//无点轮播
(()=>{
    var bannerImgs=$("[data-load=bannerImgsR]")[0],
        n=0,LIWIDTH=1140,TRANS=300,INTERVAL=2000,
        timer=null;
		/*ajax("get","data/01-index/banners.php")
	    .then(data=>{
	      var banners=[...data];
	  console.log(banners);
		}) */
       
		$.ajax({
            type:"get",
            url:"data/index_banner.php",
            success:function(data){
				var banners=[...data];
				banners.push(banners[0]);
				console.log(banners);
				console.log(data);
				var strImgs="";
				var detailUrl="articles_details.html?rid=";
				 for(var img of banners){
				strImgs+=
				  `<li>
					<a href="${detailUrl+img.rid}">
						<img src="${img.pic}">
					</a>
				  </li>`
				
				 }
				 bannerImgs.innerHTML=strImgs;
				bannerImgs.style.width=banners.length*LIWIDTH+"px";
				   
            }
			//return new Promise(resolve=>resolve());  
        })
		.then(()=>{
			function moveOnce(){
				n++;
				var left=LIWIDTH*n;
				bannerImgs.style.left=-left+"px";
				if(n==bannerImgs.children.length-1){
					setTimeout(()=>{  
						bannerImgs.style.transition="";
						bannerImgs.style.left=0;
						n=0;
						setTimeout(()=>{
						  bannerImgs.style.transition=
							"all ."+TRANS/100+"s linear";
						},100);
					  },TRANS);
				}
				  
			}
			timer=setInterval(moveOnce,INTERVAL+TRANS);
			
			bannerImgs.parentNode.onmouseover=function(){
				clearInterval(timer);
				timer=null;
			  }
			  bannerImgs.parentNode.onmouseout=function(){
				timer=setInterval(moveOnce,INTERVAL+TRANS);
			  }
		})
		
})();

 //best下具体图片‘描述

(function(){
    $.ajax({
        type:"get",
        url:"data/selected_list.php",
        success:function(data){
            var html="";
			var detailUrl="selected_details.html?lid=";
            //<a href="${detailUrl+val.lid}">
            for(var val of data){
                html+=`
                 <div class="pic_d" data-trigger="zhe_zhao1">
                        <div class="pic">
							<p>${val.lname}</p>
							<img src="${val.sm}">
				
                           <a href="${detailUrl+val.lid}" class="zhe_zhao">
							     
						   </a>
							   
                        </div>
                        <div class="detail">
                            <a href="${detailUrl+val.lid}">${val.lname}</a>
                            <p>￥${val.price}</p>
                        </div>
                    </div>
                `
            }
            $("#pic_detail").html(html);
			
			

			var html_a="";
			var detailUrl="selected_details.html?lid=";
            //<a href="${detailUrl+val.lid}">
            for(var val of data){
                html_a+=`
					<div class="pic_detail">
                 <div class="pic_d" data-trigger="zhe_zhao2">
                        <div class="pic">
								<p>${val.lname}</p>
								<img src="${val.sm}">
						
                            <a href="${detailUrl+val.lid}" class="zhe_zhao"></a>
                        </div>
                        <div class="detail">
                            <a href="${detailUrl+val.lid}">${val.lname}</a>
                            <p>￥${val.price}</p>
                        </div>
                    </div>
					
				</div>
                `
            }
            $("#Hot_commodity").html(html_a);
        },
        error:function(data){
            alert("网络故障?");
        }
    })
	.then(()=>{
		$("[data-trigger=zhe_zhao1]").hover(function(){
				$(this).children(":first-child").children().last().toggleClass("hover");
			$(this).children(":first-child").children().first().toggleClass("fuzi");
			})
		$("[data-trigger=zhe_zhao2]").hover(function(){
				$(this).children(":first-child").children().last().toggleClass("hover");
			$(this).children(":first-child").children().first().toggleClass("fuzi");
			})
	})
	
})();


//登录显示隐藏
$(()=>{
	var n=sessionStorage.getItem("uname");
	if(n){
		$("ul.login").html(`<li>
			欢迎回来：${n}<a href="logout.html">&nbsp;&nbsp;&nbsp;退出登录</a>
			</li>`);
		$("ul.login").css("left","872px");
		
		}
//?????????????????????
	$("ul.nav").on("hover","li a",function(){
		$("div.huadong").css("left","68px");
	})
	//??????????????
	$("div.ru_1").on("hover","div.wanhuo img",function(e){
		$(e.target).css("transform","scale(1.1)");

	})
})


	

