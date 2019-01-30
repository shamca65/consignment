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
//= require js/jqxcore
//= require js/jqxbuttons
//= require js/jqxscrollbar
//= require js/jqxgrid
//= require js/jqxmenu
//= require js/jqxgrid.selection
//= require js/jqxgrid.columnsresize
//= require js/jqxgrid.edit
//= require js/jqxdragdrop
//= require js/jqxdata
//= require js/jqxcheckbox
//= require js/jqxdata.export
//= require js/jqxgrid.export
//= require activestorage
//= require_tree .

$(document).ready(function(){
	
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