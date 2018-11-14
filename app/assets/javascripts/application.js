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
//= require paloma
//= require_tree .

var blank = function(){};

Paloma.controller('Application', {

    before: [
        'all -> performThis'
    ],

    performThis: function(){
        console.log('Paloma executing\n');
    }
});

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

$(document).ready(function(){
    Paloma.start();

    $('#js-ajax-link').on('click', function(e){
        e.preventDefault();

        $.get($(this).prop('href'), function(response){
            $('#js-ajax-response').html(response);
            Paloma.start();
        });
    });


});
