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
//= require js/popper.min
//= require js/jquery.gritter
//= require protip.min
//= require js/mdb
//= require js/all
//= require js/picklist
//= require activestorage
//= require_tree .

$(document).ready(function(){

    $('#customersDataTable').dataTable( {
        "paginate": true,
        "sort": true,
        "search": {
            "caseInsensitive": true
        },
        "columns": [
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
			{ "width": "50px" },	// item id
            { "width": "225px" },   // customer name
			{ "width": "225px" },   // street
			{ "width": "100px" },	// city
			{ "width": "50px" },	// size
			{ "width": "200px" },	// description
            { "width": "100px" },    // price
            { "width": "100px" },    // edit button
            { "width": "100px" }     // delete button
        ]
    } );



	$('.dataTables_filter input').attr('data-toggle', 'tooltip')
		.attr('data-placement', 'right')
		.attr('title', 'Search by any term')
		.tooltip();

	// Initialize Material Select
    $('.mdb-select').materialSelect();

	// set tooltip defaults
	$.protip({
	defaults: {
		trigger: 'hover',
		delayIn: 500,
		delayOut: 1500,
		interactive: 'false',
		arrow: false,
		size: 'normal',
		animate: 'fadeIn',
		title: 'Required field',
		gravity: false,
		placement: 'outside',
		width: 700,
		observer: false,
		skin: 'default',
		scheme: 'red',
		autoHide: 2500
	}
	});
// Data Picker Initialization
    $('.datepicker').pickadate({
        today: '',
        clear: '',
        close: ''
    });
	// Extend the default picker options for all instances.
	$.extend($.fn.pickadate.defaults, {
		formatSubmit: 'yyyy-mm-dd'
	});

});