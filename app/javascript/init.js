import M from 'materialize-css'

M.AutoInit();

M.toast({html: 'I am a toast!'})

var toastHTML = '<span>I am toast content</span><button class="btn-flat toast-action">Undo</button>';
M.toast({html: toastHTML});

$(document).ready(function(){
    $(".dropdown-trigger").dropdown();
    $('.materialboxed').materialbox();
    alert("The document is ready!");
});

$(document).on('turbo:before-visit turbo:before-cache', function() {
    return $('.toast').remove();
});



function displayToast() {
    M.toast({html: 'I am a toast', completeCallback: function(){alert('Your toast was dismissed')}})
}