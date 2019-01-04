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
//= require jquery-3.3.1.min
//= require bootstrap/bootstrap.min
//= require rails-ujs
//= require js/jquery.gritter
//= require protip.min
//= require js/mdb
//= require js/all
//= require activestorage
//= require_tree .

$(document).ready(function(){

    $('#customersDataTable').dataTable( {
        "paginate": true,
        "sort": true,
		"ajax": 'customers.json',
        "search": {
            "caseInsensitive": true
        },
        "columns": [
			{"data": "id"},
			{"data": "full_name"},
			{"data": "agreement_status"},
			{"data": "phone"},
			{"data": "email"},
			{"data": "province"},
			{"data": "email"},
			{"data": "email"},
            { "width": "50px" },    // customer id
            { "width": "120px" },   // customer name
            { "width": "75px" },    // agreement status
            { "width": "75px" },    // phone
            { "width": "75px" },    // email
            { "width": "50px" },    // province
            { "width": "75px" },    // edit button
            { "width": "75px" }     // delete button
        ]
    } );

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

	// Initialize Material Select
    $('.mdb-select').materialSelect();

	// set tooltip defaults
	$.protip({
	defaults: {
		trigger: 'hover',
		delayIn: 1000,
		interactive: 'false',
		position: 'right',
		arrow: 'true',
		icon: 'info-circled',
		size: 'large',
		animate: 'pulse',
		title: 'customzied protip',
		delayOut: 1800,
		gravity: false,
		offsetLeft: 10,
		placement: 'outside',
		width: 700,
		observer: false,
		skin: 'default',
		scheme: 'orange',
		autoHide: 2000
	}
	});

});