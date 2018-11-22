$( document ).ready(function() {
    var contr = page.controller()
    var act = page.action()

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
                    $("#jqxradiobutton2").jqxRadioButton({ width: 120, height: 25 });
                    break;

            }
            break;
        case "static":
            break;
        default:
    }
});