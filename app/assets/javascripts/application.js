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
//
//= require jquery/jquery-3.4.1.min
//= require mdb/popper
//= require mdb/bootstrap
//= require jquery/jquery.gritter
//= require mdb/mdb
//= require datatables/datatables
//= require datatables/select.bootstrap4
//= require fa/js/all
//= require misc/sweetalert2.all.min
//= require activestorage
//= require misc/fstdropdown
//= require easy-autocomplete/jquery.easy-autocomplete
//= require jquery-ui/jquery-ui
//= require dinero/umd/dinero
//= require rails.validations


// TODO refactor similar functions such as selecting, moving etc

$(document).ready(function(){

    $('#autosearch').easyAutocomplete({
        getValue: "id",
        url: function(phrase)
        {
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "items",
                header: "<b>Item List</b>"
            }
        ],
        list: {
            onChooseEvent: function() {
                var url = $input.getSelectedItemData().url
                console.log(url)

            }
        }

    });

    $('.datepicker').pickadate({});

    $.fn.dataTable.ext.errMode = 'throw';

    $('.DataTables_filter input').attr('data-toggle', 'tooltip')
        .attr('data-placement', 'left')
        .attr('title', 'Search by any term')
        .tooltip();

    jQuery.fn.dataTable.Api.register( 'sum()', function ( ) {
        return this.flatten().reduce( function ( a, b ) {
            if ( typeof a === 'string' ) {
                a = a.replace(/[^\d.-]/g, '') * 1;
            }
            if ( typeof b === 'string' ) {
                b = b.replace(/[^\d.-]/g, '') * 1;
            }

            return a + b;
        }, 0 );
    } );

    $.extend($.gritter.options, {
        position: 'top-middle', // defaults to 'top-right' but can be 'bottom-left', 'bottom-right', 'top-left', 'top-right' (added in 1.7.1)
        fade_in_speed: 'medium', // how fast notifications fade in (string or int)
        fade_out_speed: 1000, // how fast the notices fade out
        time: 2000 // hang on the screen for...
    });

// ---------------------------- Move to Donations --------------------------

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
        "buttons": {
            buttons: [
                {
                    text: 'Takein Items',
                    action: function ( ) {
                       alert("take in some items");
                    }
                }
            ]
        },
		"columns": [
			{"width": "20px"},		// item id
			{"width": "125px"},		// take in
			{"width": "20px" },		// description
			{"width": "20px" },		// gender
			{"width": "20px" },		// type
			{"width": "100px"},    // size
			{"width": "50px"},    // price
			{"width": "50px"},     // status
            {"width": "20px"}     // history
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

// ---------------------------- Move to Donations --------------------------

    var leftDonationsTable = $('#leftDonationsTable').DataTable({
        "paginate": false,
        "sort": false,
        "dom": 'Bftip',
        "bInfo": false,
        "rowId": 'id',
        "search": {
            "caseInsensitive": true
        },
        "buttons": {
            buttons: [
                {
                    text: 'Move to Donations',
                    action: function ( ) {
                        moveDonationItems(leftDonationsTable);
                    }
                }
            ]
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
        "dom": '<"toolbar"> Bfrtip',
        "search": {
            "caseInsensitive": true
        },
        "buttons": {
            buttons: [
                {
                    text: 'Commit to Donations',
                    action: function ( ) {
                        let donatedIDs = getGridItems(rightDonationsTable);
                        commitDonations(donatedIDs);
                    }
                }
            ]
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
            {name: "name", data: "name", type: "string", orderable: false, targets:   2},
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
        if ( arrayID.length > 0 ){
            // duplicate each selected row to the other grid
            to_table.rows.add(arrayID).draw();
            grid.rows({selected: true}).remove(arrayID).draw();
            to_table.rows().select();
        } else {
            Swal.fire(
                'No items are selected to donate',
                'Select one or more items first.',
                'warning'
            )
        }
    };

    function commitDonations(idArray) {
        // if the idArray is empty, only 2 brackets are left.
        if (idArray.toString().length <= 2 ) {
            Swal.fire (
                'No items are selected to save',
                'Move one or more items to donations first.',
                'error'
            )
        } else {
            $.ajax({
                type: "POST",
                url: "/items/updatedonations",
                data: idArray,
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
        }
    }

    var cleanUpTable = function(grid) {
        // remove the default row
        grid.rows().remove().draw();
    };

    window.onload = function() {
        cleanUpTable(rightDonationsTable);
    };

    // ---------------------------- Sell an Item --------------------------

   let leftSaleItemstable = $('#leftSaleItemsTable').DataTable({
        "paginate": true,
       "pageLength":10,
        "sort": false,
        "dom": 'Bftip',
        "bInfo": false,
        "rowId": 'id',
        "search": {
            "caseInsensitive": true
        },
        "buttons": {
            buttons: [
                {
                    text: 'Add to Sale',
                    action: function ( ) {
                        addItemsToSale(leftSaleItemstable);
                    }
                }
            ]
        },
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

    let rightsaleItemstable = $('#rightSaleItemsTable').DataTable({
        dom: '<"toolbar">Brtp',
        fnInitComplete: function(){
            $('div.toolbar').html('<h4>Order Total : $0.00 </h4>');
        },
        "paginate": false,
        "rowId": 'id',
        "buttons": {
            buttons: [
                {
                    text: 'Complete Sale',
                    action: function ( ) {
                        let sellingIDs = getGridItems(rightsaleItemstable);
                        commitSale(sellingIDs);
                    }
                }
            ]
        },
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

    let getGridItems = function(grid) {
        let rowData = grid.rows( { selected: true }).data().toArray();
        grid.rows({ selected: true }).remove(rowData).draw();
        // extract item ids
        let n = 0;
        let idArray = [];
            while (n < rowData.length) {
                idArray[n] = rowData[n]['id'];
                n++; }
        return idArray;
    };

    let updateSalesItemsTotals = function(v){
        let priceTotal = rightsaleItemstable.column( 4 ).data().sum();
        let totalStr = "<h4>Order Total is : $" + priceTotal.toString() + "</h4>";
        $( "div.toolbar").html(totalStr);
    };

    let addItemsToSale = function(grid) {
        to_table = ((grid == leftSaleItemstable) ? rightsaleItemstable: leftSaleItemstable);
        var arrayID = grid.rows( { selected: true }).data().toArray();

        if ( arrayID.length > 0 ) {
            to_table.rows.add(arrayID).draw();
            grid.rows({selected: true}).remove(arrayID).draw();
            to_table.rows().select();
            updateSalesItemsTotals();
        } else {
            Swal.fire(
                'No items are selected',
                'Select one or more items first.',
                'warning'
            )
        }
    };

    let commitSale = function(idArray) {
        let convertedArray = JSON.stringify(idArray, null, 4);
        // empty string will be '[]'
        if (idArray.toString().length < 2 ) {
            Swal.fire (
                'No items were added!',
                'Add one or more items to sale first.',
                'error'
            )
        } else {
            $.ajax({
                type: "POST",
                url: "/sale_items/commit_sale",
                data:convertedArray,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success:function(data){
                    updateSalesItemsHeader();
                    console.log("successfully posted sale items")
                },
                error:function(data){
                    alert("things are broken : "  + JSON.stringify(data, null, 4));
                }
            })
        }
    };

    window.onload = function() {
        cleanUpTable(rightsaleItemstable);
    };
// ---------------------------- Sale Summary --------------------------

    let saleSummarytable = $('#saleSummaryTable').DataTable({
        dom: '<"toolbar">Brtp',
        fnInitComplete: function(){
            $('div.toolbar').html('<h4>Order Total : $0.00 </h4>');
        },
        "paginate": false,
        "rowId": 'id',
        "buttons": {
            buttons: [
                {
                    text: 'Complete Sale',
                    action: function ( ) {
                        let sellingIDs = getGridItems(rightsaleItemstable);
                        commitSale(sellingIDs);
                    }
                }
            ]
        },
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