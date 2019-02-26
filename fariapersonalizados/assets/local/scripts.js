
$( document ).ready(function() {
   
});




function msgSucesso(msg){
    $.confirm({
        theme: 'bootstrap',
        title: 'Alerta!',
        content: msg,
        type: 'green',
        typeAnimated: true,
    });
}

function msgAlerta(msg){
    $.confirm({
        theme: 'bootstrap',
        title: 'Alerta!',
        content: msg,
        type: 'orange',
        typeAnimated: true,
    });
}

function msgErro(msg){
    $.confirm({
        theme: 'bootstrap',
        title: 'Alerta!',
        content: msg,
        type: 'red',
        typeAnimated: true,
    });
}

function msg(msg){
    $.confirm({
        theme: 'bootstrap',
        title: 'Alerta!',
        content: msg,
        typeAnimated: true,
    });
}




//Porcelana
function enviarPorcelana(modal){
    var nome = $('#nomePorcelana').val();
    var prod = $('#produtoPorcelana').val();
    var quant = $('#quantPorcelana').val();

    var msg = 'Olá, meu nome é ' + nome + ', gostaria de fazer um pedido de ' + quant + ' ' + prod + '.';
    console.log(msg);
    $(modal).modal('hide')
    msgSucesso('Pedido Enviado com sucesso.');
    window.open('https://api.whatsapp.com/send?phone=553195760071&text='+msg,'_blank');
}


//Polimero
function enviarPolimero(modal){
    var nome = $('#nomePolimero').val();
    var prod = $('#produtoPolimero').val();
    var quant = $('#quantPolimero').val();

    var msg = 'Olá, meu nome é ' + nome + ', gostaria de fazer um pedido de ' + quant + ' ' + prod + '.';
    console.log(msg);
    $(modal).modal('hide')
    msgSucesso('Pedido Enviado com sucesso.');
    window.open('https://api.whatsapp.com/send?phone=553195760071&text='+msg,'_blank');
}



//Acrilico
function enviarAcrilico(modal){
    var nome = $('#nomeAcrilico').val();
    var prod = $('#produtoAcrilico').val();
    var quant = $('#quantAcrilico').val();

    var msg = 'Olá, meu nome é ' + nome + ', gostaria de fazer um pedido de ' + quant + ' ' + prod + '.';
    console.log(msg);
    $(modal).modal('hide')
    msgSucesso('Pedido Enviado com sucesso.');
    window.open('https://api.whatsapp.com/send?phone=553195760071&text='+msg,'_blank');
}


//Copo Acrilico
function enviarCopoAcrilico(modal){
    var nome = $('#nomeCopoAcrilico').val();
    var prod = $('#produtoCopoAcrilico').val();
    var quant = $('#quantCopoAcrilico').val();

    var msg = 'Olá, meu nome é ' + nome + ', gostaria de fazer um pedido de ' + quant + ' ' + prod + '.';
    console.log(msg);
    $(modal).modal('hide')
    msgSucesso('Pedido Enviado com sucesso.');
    window.open('https://api.whatsapp.com/send?phone=553195760071&text='+msg,'_blank');
}


//Etiquetas
function enviarEtiqueta(modal){
    var nome = $('#nomeEtiqueta').val();
    var prod = $('#produtoEtiqueta').val();
    var quant = $('#quantEtiqueta').val();

    var msg = 'Olá, meu nome é ' + nome + ', gostaria de fazer um pedido de ' + quant + ' ' + prod + '.';
    console.log(msg);
    $(modal).modal('hide')
    msgSucesso('Pedido Enviado com sucesso.');
    window.open('https://api.whatsapp.com/send?phone=553195760071&text='+msg,'_blank');
}