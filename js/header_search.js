(()=>{
  function loadProductsByPage(n=1){
    var url="data/selected_search.php";
    var params=location.search.slice(1)+"&pno="+n;
    $.get(url,params)
      .then(data=>{
		
      //加载数据
      var html="";
			var detailUrl="selected_details.html?lid=";
            //<a href="${detailUrl+val.lid}">
            for(var val of data.data){
                html+=`
                 <div class="pic_d">
                    <div class="pic">
                        <a href="${detailUrl+val.lid}">
                            <img src="${val.sm}" alt="">
                        </a>
                    </div>
                    <div class="detail">
                        <p>“${val.title}”</p>
                    </div>
                    <div class="collect_time clear">
                        <div class="collect">
                            <i>❤</i>
                            <span>12</span>
                        </div>
                        <div class="time">
                            <span>2小时前</span>
                        </div>
                    </div>
                    <div class="zhezhao">

                    </div>
                </div>
                `
            }
            $("#selected_list").html(html);
		})
	}
  
  loadProductsByPage(1);
})()
  