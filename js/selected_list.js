/**
 * Created by Administrator on 2017/10/15 0015.
 */
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
        },
        error:function(data){
            alert("网络故障?");
        }
    })
})()