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
//= require jqwidgets/jqxcore
//= require paloma
//= require_tree .

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






