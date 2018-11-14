var blank = function(){};

Paloma.controller('Static < Application', {
    index: blank,
    mega: function(){
        var msg = this.params['msg'];
        var element = document.querySelector('div.msg');
        element.textContent = msg;

        $("#timerNotification").jqxNotification(
            {   width: 300,
                position: "top-right",
                autoOpen: true,
                closeOnClick: true,
                autoClose: true,
                showCloseButton: true,
                template: "success",
            });
        $("#timertNotification").jqxNotification("open");
    },
    show: blank
});