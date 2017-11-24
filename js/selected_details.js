(()=>{
	const LIWIDTH=40;
	$.get("data/selected_details.php",location.search.slice(1))
		.then(data=>{
		console.log(data);
		var html="";
		html+=
			`
			<div class="details_img_det clear insert">
                                    <div class="details_img">
                                        <img src="${data[2]}" alt="" id="details_img"/>
                                    </div>
                                    <div class="details_det">
                                         <p>${data[1]}</p>
										<h4>${data[3]}</h4>
                                        <h2>￥${data[0]}</h2>
                                        <p>❤13</p>
                                        <div>
                                            <a href="#">❤Like</a>
                                            <a href="#">Buy</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="details_sm_pic">
                                        <ul>
                                            <li>
                                                <img src="${data[2]}" alt=""/>
                                                <img src="${data[2]}" alt=""/>
                                            </li>
                                        </ul>
                                </div>	
			`
			$("#detailsA").html(html);
				//$(".details_sm_pic>ul").css("width",LIWIDTH*data.length);
			

		var htmla="";
		htmla+=`
			<div class="avatar">
                                 <img src="${data[2]}" alt=""/>
                                </div>
                                <div class="tuwen">
                                    <a href="#">${data[1]}...</a>
                                    <p>${data[3]}</p>
                                    <a href="#">赞</a>
                                    <a href="#">踩</a>
                                </div>
                                <div class="time">
                                    <p>❤</p>
                                    <h3> 2017-09-03</h3>
                                </div>
			
		`
		$("#comments_d").html(htmla);

		

		//??待测试
		$("div.details_sm_pic ul").on('click','li>img',(e)=>{
			$img=$(e.target).attr("src");
			$(".details_img>img").attr("src",$img);
		})
		$("#details_img").hover(function(){
			$img=$(this);
			$img.css("scale",1.1);
		})


	})

		
	

})();