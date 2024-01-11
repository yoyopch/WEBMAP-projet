
window.addEventListener("load", init);


function init(){
    var btnLogin = document.getElementById('btn_login');
    const nav_bar = document.querySelector(".navbar-toggler");
    var form = document.querySelector('#loginlogin');
    const btnprofil = document.querySelector('#profilprofil');
    const msgwelcome = document.querySelector('#welcome');


    nav_bar.addEventListener("click" , function(){
        isConnectedNav(function(reponse){
            if (reponse) {
                btnLogin.classList.remove('btn-outline-success');
                btnLogin.classList.add('btn-outline-danger');
                btnLogin.innerHTML = "Disconnect"
                form.action = "../disconnect.php";
                btnprofil.innerHTML = `
                       <button class="btn btn-primary btnProfil" type="submit" id="btn_profil">Profil</button>
                `
                msgwelcome.style.display = "block"

            }else {
                btnLogin.classList.remove('btn-outline-danger');
                btnLogin.classList.add('btn-outline-success');
                btnLogin.innerHTML = "Login"
                form.action = "../login/login.php";
                btnprofil.innerHTML = ``
                msgwelcome.style.display = "none"
            }
        })
    })
}

function isConnectedNav(callback){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'isconenctedNav',
        },
        dataType: "json",

        success: function(response) {
            callback(response);
        }
    });
}

