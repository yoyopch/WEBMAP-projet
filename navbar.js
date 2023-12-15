$(init);
function init(){
    var imgwidth = $(".logoAccount").width();
    var lenName=$(".userName").length;

    console.log(imgwidth);

    $(".panierNav").css("right",imgwidth+lenName+20);

}