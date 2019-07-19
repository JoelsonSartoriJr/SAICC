/**
 * Váriaveis usadas durante o desenvolvimento
 */
var CARD_CONTAINER = document.getElementsByClassName('card-container')[0];
/**
     * firebase: objeto global
     * database(): metodo para acesso ao realtime database
     * ref(): url em string para referencia do caminho do banco
     * set(): metodo que cria dados na url passada
     */
var ref = firebase.database().ref('administracao/favoritos/');
var ref1 = firebase.database().ref('conteudo/eventos/');

/**
 * Espera o evento de que a DOM está pronta para executar algo
 */
document.addEventListener("DOMContentLoaded", function () {

    ref.orderByKey().on('child_added', snapshot => {
        var titulo = ''; 
        var qtd = 0;
        ref1.equalTo(snapshot.key).once(snapshot => {
            titulo = snapshot.val().titulo;
        })
        qtd = snapshot.val().length;
        adicionaCardATela(titulo, qtd);
    })
});

/**
 * Adiciona card na tela
 */
function adicionaCardATela(titulo, qtd) {
    /**
     * HEADER DO CARD
     */
    let header = document.createElement("h2");
    header.innerText = titulo;
    header.classList.add('card-title');
    // ===================================

    /**
     * CONTENT DO CARD
     */
    let tipo = document.createElement("p");
    tipo.classList.add('card-text');
    tipo.innerText = 'No total '+ qtd + ' pessoas favoritaram o evento';
    
    // ===================================

    /**
     * CARD
     */
    let card = document.createElement("div");
    card.classList.add('card');
    let card_body = document.createElement("div");
    card_body.classList.add('card-body');
    // ===================================

    // popula card
    card_body.appendChild(header);
    card_body.appendChild(tipo);
    card.appendChild(card_body);

    // insere no container
    CARD_CONTAINER.appendChild(card);
}

function logout() {
    firebase.auth().signOut().then(() => {
    });
}