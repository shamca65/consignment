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
//= require js/datatables
//= require js/dataTables.select.min
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
	$('#customersDataTable').DataTable({
		"paginate": true,
		"sort": true,
		"search": {
			"caseInsensitive": true
		},
		"columns": [
			{"width": "50px"},    // customer id
			{"width": "120px"},   // customer name
			{"width": "75px"},    // agreement status
			{"width": "75px"},    // phone
			{"width": "75px"},    // email
			{"width": "50px"},    // province
			{"width": "75px"},    // edit button
			{"width": "75px"}     // delete button
		]
	});

	$('#itemsDataTable').DataTable({
		"paginate": true,
		"sort": true,
		"search": {
			"caseInsensitive": true
		},
		"columns": [
			{"width": "50px"},	// item id
			{"width": "225px"},   // customer name
			{"width": "225px"},   // street
			{"width": "100px"},	// city
			{"width": "50px"},	// size
			{"width": "200px"},	// description
			{"width": "100px"},    // price
			{"width": "100px"},    // edit button
			{"width": "100px"}     // delete button
		]
	});

	$('.DataTables_filter input').attr('data-toggle', 'tooltip')
		.attr('data-placement', 'right')
		.attr('title', 'Search by any term')
		.tooltip();

	//var selectedRows = leftGrid.rows({ selected: true }).ids(true);
	var table = $('#example').DataTable({
		paginate: false,
		sort: false,
		bInfo: false,
		rowId: 'id',
		search: {
			"caseInsensitive": true
		},
		columns: [
			{item: "ID",data: "id","width": "50px"},	// item id
			{item: "Name",data: "name","width": "225px"}, // customer name
			{item: "Description",data: "description","width": "200px"},	// description
			{item: "Size",data: "size","width": "60px"},	// size
			{item: "Price",data: "price","width": "75px"},	// real price
			{item: "Days",data: "days","width": "75px"}	// days in store
		],
		columnDefs: [ {
			orderable: false,
			className: 'select-checkbox',
			targets:   0
		},
			{ "name": "chk",   "targets": 0 },
			{ "name": "ID",  "targets": 1 },
			{ "name": "Name", "targets": 2 },
			{ "name": "Description",  "targets": 3 },
			{ "name": "Size",    "targets": 4 },
			{ "name": "Price",    "targets": 5 },
			{ "name": "Days",    "targets": 6 }
		 ]	,
		select: {
			style:    'multi',
			selector: 'td:first-child'
		},
		order: [[ 1, 'asc' ]]
	});

	var table2 = $('#example2').DataTable({
		"paginate": false,
		"sort": false,
		"bInfo": false,
		"rowId": 'id',
		"search": {
			"caseInsensitive": true
		},
		"columns": [
			{item: "ID",data: "id","width": "50px"},	// item id
			{item: "Name",data: "name","width": "225px"}, // customer name
			{item: "Description",data: "description","width": "200px"},	// description
			{item: "Size",data: "size","width": "60px"},	// size
			{item: "Price",data: "price","width": "75px"},	// real price
			{item: "Days",data: "days","width": "75px"}	// days in store
		],
		columnDefs: [ {
			orderable: false,
			className: 'select-checkbox',
			targets:   0
		} ],
		select: {
			style:    'multi',
			selector: 'td:first-child'
		},
		order: [[ 1, 'asc' ]]
	});


	var moveItems = function(table) {
		//var selectedRows = new Array();
		// get selected rows with the cell data
		var count = table.rows( { selected: true } ).count();
		var arrayID = table.rows( { selected: true } ).ids();
		//
		// duplicate each selected row to the other grid
		table2.rows.add(arrayID).draw();
		//to_grid = ((grid == leftGrid) ? rightGrid : leftGrid);
		//{
		//	var value = to_grid.jqxGrid('addrow', null, selectedRowData);
		//}
		//remove selected items from left grid
		//removeSelectedRows(rowIdvals, grid);
	};

	$('#example tbody').on('click', 'tr', function () {
		var data = table.row( this ).data();
		console.log(data);
	} );

	$('#btnMoveToStoreStock').click(function () {
		moveItems(table);
	});

});