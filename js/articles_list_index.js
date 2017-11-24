/**
 * Created by Administrator on 2017/10/15 0015.
 */
(function(){
    $.ajax({
        type:"get",
        url:"data/articles_details_index.php",
        success:function(data){
            var html="";
			var detailUrl="articles_details.html?rid=";
            //<a href="${detailUrl+val.rid}">
            for(var val of data){
                html+=`
                 <div class="pic_d">
                        <div class="pic">
                            <a href="${detailUrl+val.rid}">
                                <img src="${val.pic}"
                                     title="${val.title}"/>
                            </a>
                            <div class="zhe_zhao"></div>
                        </div>
                        <div class="detail clear">
                            <a href="#" title="${val.title}">
                                ${val.title}
                            </a>
                            <p>${val.sub_title}</p>
                            <div class="time"><span>14小时前</span></div>
                        </div>
                    </div>
                `
            }
            $("#articles_list").html(html);
        },
        error:function(data){
            alert("网络故障！");
        }
    })
})()