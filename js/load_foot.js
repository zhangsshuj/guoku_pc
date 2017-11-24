

(()=>{
    ajax("get","footer.html")
        .then(html=>{
            //console.log(html);
            $("div.foot")[0].innerHTML=html;
            document.head.innerHTML=
                document.head.innerHTML+
                '<link rel="stylesheet" href="css/footer.css">';

        })

})();

/*

$(document).load("footer.html",function(html){
    $("div.foot").html(html);
    $("head").append('<link rel="stylesheet" href="css/footer.css">');
});
*/