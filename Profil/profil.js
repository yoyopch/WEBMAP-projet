
window.addEventListener("load", init);



function init(){
    getCommand(function (response) {
        let commande = response
        if (commande.length !== 0) {
            let html = ''
            let nombreIterations = 0
            for (const element of commande) {
                nombreIterations++;
                html += `
              <div class="block_voir_commande">
                    <div class="txt_etat"><p>ID #${nombreIterations}</p></div>
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
