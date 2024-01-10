
window.addEventListener("load", init);





function init(){
    var btnLogin = document.getElementById('btn_login');
    const nav_bar = document.querySelector(".navbar-toggler");
    var form = document.querySelector('.d-flex');

    nav_bar.addEventListener("click" , function(){
        isConnected(function(reponse){
           console.log(reponse)
            if (reponse) {
                btnLogin.classList.remove('btn-outline-success');
                btnLogin.classList.add('btn-outline-danger');
                btnLogin.innerHTML = "Disconnect"
                form.action = "../disconnect.php";

            }else {
                btnLogin.classList.remove('btn-outline-danger');
                btnLogin.classList.add('btn-outline-success');
                btnLogin.innerHTML = "Login"
                form.action = "../login/login.php";
            }
        })
    })
}

