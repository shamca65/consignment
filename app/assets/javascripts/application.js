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
//= require popper.min
//= require bootstrap.min
//= require mdb
//= require custom
//= require rails-ujs
//= require activestorage
//= require paloma
//= require_tree .

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

$(function(){
    $('#customersDataTable').dataTable( {
        "paginate": true,
        "sort": true,
        "search": {
            "caseInsensitive": true
        }
    } );
});

$(function(){
    $('#itemsDataTable').dataTable( {
        "paginate": true,
        "sort": true,
        "search": {
            "caseInsensitive": true
        },
        "columns": [
            null,
            { "width": "50px" },    // customer id
            { "width": "150px" },   // customer name
            null,
            null,
            { "width": "75px" },    // price
            { "width": "75px" },    // edit button
            { "width": "75px" }     // delete button
        ]
    } );
});