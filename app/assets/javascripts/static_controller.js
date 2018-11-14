var blank = function(){};

Paloma.controller('Static < Application', {
    index: function(){
        var notificationWidth = 300;
        $("#timerNotification").jqxNotification(
            { width: notificationWidth,
                position: "top-right",
                autoOpen: true,
                closeOnClick: true,
                autoClose: true,
                showCloseButton: false,
                template: "success",
             });
        $("#timertNotification").jqxNotification("open");
    },
    show: blank,
    mega: blank
});