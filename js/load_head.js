(()=>{
    ajax("get","header.html")
    .then(html=>{
            //console.log(html);
            $("div.head")[0].innerHTML=html;
            document.head.innerHTML=
                document.head.innerHTML+
                '<link rel="stylesheet" href="css/header.css">';
				return new Promise(resolve=>resolve());
        })
		.then(()=>{
			//搜索
			var shelper=
			 $("#shelper")[0],txtSearch=$("#txtSearch")[0];

			
			if(location.pathname.endsWith("Selected_search.html")
          &&location.search!="")
				txtSearch.value=
        decodeURIComponent(location.search.split("=")[1]);
			window.onclick=function(e){
      if(e.target.id!="shelper"&&e.target.id!="txtSearch")
        shelper.style.display="none";
		}

		//按键抬起时触发
		txtSearch.onfocus=
    txtSearch.onkeyup=function(e){
      var txt=this;
      if(e.keyCode!=38&&e.keyCode!=40&&e.keyCode!=13){
        if(txt.value!=""){
          shelper.style.display="block";
          ajax("get","data/header_search.php?kw="+txt.value)
          .then(data=>{
            if(data.length>0){
              var html="";
              for(var obj of data){
                html+=
                `<li title="${obj.lname}">
                  <div class="search-item">${obj.lname}</div>
                </li>`
              }
              shelper.innerHTML=html;
            }else{
              shelper.innerHTML="未找到匹配商品";
            }
            return new Promise(resolve=>resolve())
          })
			.then(()=>{
            shelper.onclick=function(e){
              if(e.target.nodeName=="DIV"){
                txt.value=e.target.parentNode.title;
                setTimeout(
                  ()=>location="Selected_search.html?kw="+txt.value
                ,500);
              }
            }
            $("[data-trigger=search]")[0].onclick=function(e){
              e.preventDefault();
              if(txt.value!="")
                location="Selected_search.html?kw="+txt.value;
            }
          })
        }else
          shelper.style.display="none";
      }
    };

	//按下时触发
	txtSearch.onkeydown=function(e){  
      var txt=this; 
      if(shelper.style.display=="block"&&shelper.children.length!=0){
        if(e.keyCode==38||e.keyCode==40){
          var focusLi=shelper.find(".focus")[0];
          if(focusLi===undefined){
            shelper.children[0].className="focus";
          }else{
            switch(e.keyCode){
              case 38:
                if(focusLi==shelper.children[0]){
                  focusLi.className="";
                  shelper.lastElementChild.className="focus";
                }else{
                  focusLi.className="";
                  focusLi.previousElementSibling.className="focus";
                }
                break;
              case 40:
                if(focusLi==shelper.lastElementChild){
                  focusLi.className="";
                  shelper.firstElementChild.className="focus";
                }else{
                  focusLi.className="";
                  focusLi.nextElementSibling.className="focus";
                }
                break;
            }
          }
          txt.value=shelper.find(".focus")[0].title;
        }else if(e.keyCode==13){
          location="Selected_search.html?kw="+txt.value;
        }
      }
    };
	
	

	//固定导航栏，？？？
	var header=document.getElementById("header");
	$(window)[0].scroll(()=>{
		if($("body")[0].scrollTop()>=300){
			header.style.position="fixed";
			header.style.top="0";
			header.style.left="105";
			header.style.zIndex='9999';	
			header.style.background="#ddd";
		}else{
			header.style.position="static";
		}
	});		




			//首页导航滑块处理，bug
			var ops = document.querySelectorAll(".nav li");
			var di = document.querySelectorAll(".huadong")[0];
			for (let p of ops) {
			p.addEventListener("hover", function () {
				 di.classList.ClassName("hover");
			}, false)  
				}

		})

})();
