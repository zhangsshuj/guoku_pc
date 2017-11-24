/**
 * Created by Administrator on 2017/9/18 0018.
 */
(()=>{
    ajax("get","head_erjipage.html")
        .then(html=>{
            //console.log(html);
            $("div.h_general")[0].innerHTML=html;
            document.head.innerHTML=
                document.head.innerHTML+
                '<link rel="stylesheet" href="css/head_erjipage.css">';

        });

})();
