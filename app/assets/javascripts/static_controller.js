var blank = function(){};

Paloma.controller('Static < Application', {
    index: blank,
    mega: function(){
        var msg = this.params['msg'];
        document.getElementById("jqmsg").innerHTML=msg;

        $("#jq-notificationWin").jqxNotification(
            {   width: 300,
                height: 100,
                position: "top-right",
                autoOpen: true,
                closeOnClick: true,
                autoClose: true,
                showCloseButton: true,
                template: "success",
            });
    }
});