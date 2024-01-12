
window.addEventListener("load", init);



function init(){
    getCommand(function (response) {
        let commande = response
        if (commande.length !== 0) {
            let html = ''

            for (const element of commande) {
                html += `
              <div class="block_voir_commande">
                    <div class="txt_etat"><p>ID #${element['id_commande']}</p></div>
                    <input type="button" value="Voir la commande">
                </div>
                <br>
            `;
            }
            document.querySelector(".etat_commande").innerHTML = html
        }
    })
}

function getCommand(callback){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'getcommand',

        },
        dataType: "json",

        success: function(response){
            callback(response);
        }
    });
}
