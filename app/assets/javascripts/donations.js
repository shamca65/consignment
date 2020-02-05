$(document).ready(function() {
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

    let getGridItems = function (grid) {
        let rowData = grid.rows({selected: true}).data().toArray();
        grid.rows({selected: true}).remove(rowData).draw();
        // extract item ids
        let n = 0;
        let idArray = [];
        while (n < rowData.length) {
            idArray[n] = rowData[n]['id'];
            n++;
        }
        return idArray;
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

    window.onload = function() {
        rightDonationsTable.rows().remove().draw();
    };

});