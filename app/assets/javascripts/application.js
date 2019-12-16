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
//	note 'all.js' = font awesome
//
//= require jquery/jquery-3.4.1.min
//= require mdb/popper
//= require mdb/bootstrap
//= require jquery/jquery.gritter
//= require mdb/mdb
//= require jquery/jquery.dataTables
//= require datatables/datatables
//= require datatables/dataTables.select
//= require misc/protip.min
//= require fa/js/all
//= require activestorage
//= require misc/fstdropdown
//= require jquery-ui/jquery-ui
//= require dinero/umd/dinero
//= require rails.validations

$(document).ready(function(){

    // Data Picker Initialization
    $('.datepicker').pickadate({});

	$.extend($.gritter.options, { 
		position: 'top-middle', // defaults to 'top-right' but can be 'bottom-left', 'bottom-right', 'top-left', 'top-right' (added in 1.7.1)
		fade_in_speed: 'medium', // how fast notifications fade in (string or int)
		fade_out_speed: 1000, // how fast the notices fade out
		time: 2000 // hang on the screen for...
	});

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

	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper"
	});

    $('#customersDataTable').DataTable({
		"pageLength":10,
		"dom": "Bfrtip",
		"columns": [
			{"width": "50px"},    // customer id
			{ "width": "30px" },    // last updated date
			{ "width": "30px" },    // acct open date
			{"width": "120px"},   // customer name link
			{"width": "75px"},    // agreement status
			{"width": "75px"},    // phone
			{"width": "75px"},    // email
			{"width": "50px"},    // province
			{"width": "75px"}     // delete button
		]
	});

	$('#itemsDataTable').DataTable({
		"order": [[1, 'desc']],
		"pageLength":15,
		"dom": "Bfrtip",
		"columns": [
			{"width": "30px"},		// item id
			{ "width": "30px"},		// take in date - ordered desc
			{"width": "15px"},		// gender
			{"width": "15px"},		// size
			{"width": "15px"},		// type
			{"width": "125px"},		// description
			{"width": "75px"},   	// customer name
			{"width": "10px"},		// phone
			{"width": "100px"},    // price
			{"width": "50px"},    // edit button
			{"width": "50px"}     // delete button
		]
	});

	$('#customerItemsDataTable').DataTable({
		"pageLength":10,
		"dom": '<"toolbar"> Bfrtip',
		"buttons": [{
			extend: 'print',
			footer: true
		}],
		"columns": [
			{"width": "20px"},		// item id
			{"width": "125px"},		// description
			{ "width": "20px" },		// take in date
			{ "width": "20px" },		// take in date
			{ "width": "20px" },		// take in date
			{"width": "100px"},    // price
			{"width": "50px"},    // edit button
			{"width": "50px"}     // delete button
		]
	});

	$('#configsDataTable').DataTable({
		"pageLength":5,
		"dom": "Bfrtip",
		"columns": [
			{"width": "15px"},		// slug
            {"width": "15px"}		// current pickup date
		]
	});

	$('.DataTables_filter input').attr('data-toggle', 'tooltip')
		.attr('data-placement', 'left')
		.attr('title', 'Search by any term')
		.tooltip();

// ---------------------------- Move to Donations --------------------------
	var leftDonationsTable = $('#leftDonationsTable').DataTable({
		"paginate": false,
		"sort": false,
		"bInfo": false,
		"rowId": 'id',
		"search": {
			"caseInsensitive": true
		},
		"columns": [
			{item: "","width": "50px"},
			{item: "ID","width": "50px"},	// item id
			{item: "Name","width": "225px"}, // customer name
			{item: "Description","width": "200px"},	// description
			{item: "Size","width": "60px"},	// size
			{item: "Price","width": "75px"},	// real price
			{item: "Days","width": "75px"}	// days in store
		],
		columnDefs: [
			{title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
			{name: "id", data: "id", orderable: false, targets:   1},
			{name: "name", data: "name", orderable: true, targets:   2},
			{name: "description", data: "description", orderable: false, targets:   3},
			{name: "size", data: "size", orderable: false, targets:   4},
			{name: "price", data: "price", orderable: false, targets:   5},
			{name: "days", data: "days", orderable: false, targets: 6}
		],
		select: {
			style:    'multi',
			selector: 'td:first-child'
		},
		order: [[ 1, 'asc' ]]
	}); // was 'Table'

	var rightDonationsTable = $('#rightDonationsTable').DataTable({
		"paginate": false,
		"sort": false,
		"bInfo": false,
		"rowId": 'id',
		//"ajax":{
		//	"url" : "/items/updatepickups",
		//	"type" : "POST"
		//},
		"search": {
			"caseInsensitive": true
		},
		"initComplete": function(settings, json) {
		    //
		},
		"columns": [
			{item: "","width": "50px"}, // check box
			{item: "ID","width": "50px"},	// item id
			{item: "Name","width": "225px"}, // customer name
			{item: "Description","width": "200px"},	// description
			{item: "Size","width": "60px"},	// size
			{item: "Price","width": "75px"},	// real price
			{item: "Days","width": "75px"}	// days in store
		],
		columnDefs: [
			{title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
			{name: "id", data: "id", orderable: false, targets:   1},
			{name: "name", data: "name", orderable: false, targets:   2},
			{name: "description", data: "description", orderable: false, targets:   3},
			{name: "size", data: "size", orderable: false, targets:   4},
			{name: "price", data: "price", orderable: false, targets:   5},
			{name: "days", data: "days", orderable: false, targets: 6}
		],
		select: {
			style:    'multi',
			selector: 'td:first-child'
		},

		order: [[ 1, 'asc' ]]
	}); // was 'Table2'

	var locateCustomer = $('#customerLocateTable').DataTable({
		"paginate": true,
		"sort": false,
		"columns": [
			{item: "ID","width": "75px"},		// item id
			{item: "Name","width": "100px"}, 	// customer name,
			{item: "","width": "50px"} 		// link 
		],
		columnDefs: [
			{name: "id", data: "id", orderable: false, targets:   0},
			{name: "name", data: "name", orderable: false, targets:   1},
			{name: "", data: "", orderable: false, targets:   2}
		]
	});

	var commitItems = function(table) {
		var rows = rightDonationsTable.rows().remove().draw();
	};

	var moveDonationItems = function(grid) {
		to_table = ((grid == leftDonationsTable) ? rightDonationsTable : leftDonationsTable);
		// get selected rows with the cell data
		var arrayID = grid.rows( { selected: true }).data().toArray();
		// duplicate each selected row to the other grid
		to_table.rows.add(arrayID).draw();
		grid.rows({ selected: true }).remove(arrayID).draw();
		to_table.rows().select();
	};

	var postPickups = function(){};

	var cleanUpTable2 = function() {
		// remove the default row
        rightDonationsTable.rows().remove().draw();
	};

	$('#btnMoveToStoreStock').click(function () {
		moveDonationItems(leftDonationsTable);
	});

	$('#btnCommit').click(function () {
		cleanUpTable2();
		commitItems();
	});

	$('#btnReturn').click(function () {
		moveItems(rightDonationsTable);
	});

	window.onload = function() {
		cleanUpTable2();
	};

    // ---------------------------- Sell an Item --------------------------
    var leftSaleItemstable = $('#leftSaleItemsTable').DataTable({
        "pageLength":20,
        "dom": "Bfrtip",
        "rowId": 'id',
        "search": {
            "caseInsensitive": true
        },
        "columns": [
            {item: "","width": "40px"},
            {item: "ID","width": "50px"},	            // item id
            {item: "Description","width": "200px"},	    // description
            {item: "Size","width": "60px"},	            // size
            {item: "Price","width": "75px"},	        // real price
        ],
        columnDefs: [
            {title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
            {name: "id", data: "id", orderable: false, targets:   1},
            {name: "description", data: "description", orderable: false, targets:   2},
            {name: "size", data: "size", orderable: false, targets:   3},
            {name: "price", data: "price", orderable: false, targets:   4}
        ],
        select: {
            style:    'multi',
            selector: 'td:first-child'
        },
        order: [[ 1, 'asc' ]]
    });

    var rightsaleItemstable = $('#rightSaleItemsTable').DataTable({
        "dom": "Brtip",
        "bFilter": false,
        "paginate": false,
        "rowId": 'id',
        "columns": [
            {item: "","width": "40px"},
            {item: "ID","width": "50px"},	// item id
            {item: "Description","width": "200px"},	// description
            {item: "Size","width": "60px"},	// size
            {item: "Price","width": "75px"},	// real price
        ],
        columnDefs: [
            {title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
            {name: "id", data: "id", orderable: false, targets:   1},
            {name: "description", data: "description", orderable: false, targets:   2},
            {name: "size", data: "size", orderable: false, targets:   3},
            {name: "price", data: "price", orderable: false, targets:   4}
        ],
        select: {
            style:    'multi',
            selector: 'td:first-child'
        },
        order: [[ 1, 'asc' ]]
    });

    var moveSaleItems = function(grid) {
        to_table = ((grid == leftSaleItemstable) ? rightsaleItemstable: leftSaleItemstable);
        // get selected rows with the cell data
        var arrayID = grid.rows( { selected: true }).data().toArray();
        // duplicate each selected row to the other grid
        to_table.rows.add(arrayID).draw();
        grid.rows({ selected: true }).remove(arrayID).draw();
        to_table.rows().select();
    };

    $('#btnAddToSale').click(function () {
        moveSaleItems(leftSaleItemstable);
    });

    $.fn.dataTable.ext.errMode = 'throw';


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