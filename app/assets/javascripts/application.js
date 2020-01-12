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
//= require rails-ujs
//= require turbolinks
//= require jquery/jquery-3.4.1.min
//= require mdb/popper
//= require mdb/bootstrap
//= require jquery/jquery.gritter
//= require mdb/mdb.min
//= require datatables/datatables.min
//= require datatables/select.bootstrap4.min
//= require fa/js/all.min
//= require misc/sweetalert2.all.min
//= require activestorage
//= require misc/fstdropdown.min
//= require easy-autocomplete/jquery.easy-autocomplete
//= require jquery-ui/jquery-ui
//= require misc/currency.min
//= require rails.validations

// TODO - evaluate use of browser cache

$(document).ready(function(){

    $('.datepicker').pickadate({});

    $.fn.dataTable.ext.errMode = 'throw';

    $('.DataTables_filter input').attr('data-toggle', 'tooltip')
        .attr('data-placement', 'left')
        .attr('title', 'Search by any term')
        .tooltip();

    $.extend($.gritter.options, {
        position: 'top-middle', // defaults to 'top-right' but can be 'bottom-left', 'bottom-right', 'top-left', 'top-right' (added in 1.7.1)
        fade_in_speed: 'medium', // how fast notifications fade in (string or int)
        fade_out_speed: 1000, // how fast the notices fade out
        time: 2000 // hang on the screen for...
    });

	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper"
	});

	$('#configsDataTable').DataTable({
		"pageLength":5,
		"dom": "Bfrtip",
		"columns": [
			{"width": "15px"},		// slug
            {"width": "15px"}		// current pickup date
		]
	});

// ---------------------------- Client side validations --------------------------
	window.ClientSideValidations.callbacks.element.fail = function (element, message, callback) {
		callback();
	
		if (element.data('valid') !== false) {
			element.parent().find('.message').hide().show('slide', { direction: "left", easing: "easeOutBounce" }, 500);
		}
	}

	window.ClientSideValidations.callbacks.element.pass = function (element, callback) {
		// Take note how we're passing the callback to the hide()
		// method so it is run after the animation is complete.
		element.parent().find('.message').hide('slide', { direction: "left" }, 500, callback);
	}

});