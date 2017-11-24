$(()=>{
	$.get("data/articles_details.php",location.search.slice(1))
		.then(data=>{
		console.log(data.data);
		var html="";
		html+=`
			<p><a href="#">图文</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
		${data.data[0]}</p>	
		
		`
		$("#shou_nav").html(html);
		$("#articles_a>h2").text(data.data[0]);
		
	})

})