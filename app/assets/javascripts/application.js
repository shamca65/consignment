// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require gritter/jquery.gritter
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jqwidgets/jqxcore
//= require paloma
//= require_tree .


var test=function(){
    alert("henlo");
}

$(document).ready(function(){

    var contr = page.controller()
    var act = page.action()

    Paloma.start();

    $('#js-ajax-link').on('click', function(e){
        e.preventDefault();

        $.get($(this).prop('href'), function(response){
            $('#js-ajax-response').html(response);
            Paloma.start();
        });
    });


    $('#add-regular').click(function(){

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'This is a regular notice!',
            // (string | mandatory) the text inside the notification
            text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
            // (string | optional) the image to display on the left
            image: 'assets/019-cap.svg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: ''
        });

        return false;

    });

    switch(contr) {
        case "items":
            switch(act) {
                case "edit":

                    $("#currencyInput").jqxNumberInput({
                        template: 'primary',
                        width: '150px',
                        height: '35px',
                        symbol: '$',
                        spinButtons: true,
                        digits: 3,
                        decimalDigits: 2
                    });

                    break;
                default:
                    break;
            }
            break;
        case "customers":
            switch(act) {
                case "new":
                    $("#phoneInput").jqxMaskedInput({ mask: '(###)###-####', width: 250, height: 30  });


                    $('#phoneInput').jqxValidator({
                        rules: [
                            { input: '#phoneInput', message: 'Invalid phone number!', action: 'valuechanged, blur', rule: 'phone' }]
                    });

                    $('#emailInput').jqxValidator({
                        rules: [
                            { input: '#emailInput', message: 'E-mail is required!', action: 'keyup, blur', rule: 'required' },
                            { input: '#emailInput', message: 'Invalid e-mail!', action: 'keyup', rule: 'email' }]
                    });

                case "takein":
                    $("#itemPrice").jqxNumberInput({
                        template: 'primary',
                        width: '150px',
                        height: '32px',
                        symbol: '$',
                        spinButtons: true,
                        digits: 3,
                        decimalDigits: 2
                    });
                    break;

            }
            break;
        case "static":
            break;
        default:
    }

});






