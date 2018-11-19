$( document ).ready(function() {
    if(!page.isControllerAndAction('items', 'edit')) return;
    alert('ok this is ok')
    console.log( "ready!" );
});