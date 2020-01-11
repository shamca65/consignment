$(document).ready(function() {

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

    var autoCompleteOptions = {

        url: function(phrase) {
            return "/search.json?q=" + phrase;
        },
        getValue: function(element) {
            return element.id;
        },
        template: {
            type: "description",
            fields: {
                description: "description",
                size: "size"
            }
        },
        list: {
            onClickEvent: function() {
                let idx =  $("#item_auto_complete").getSelectedItemIndex();
                let itemData = $("#item_auto_complete").getSelectedItemData(idx);
                itemData["0"] = "0";
                dataArray = [];
                dataArray[0] = itemData;
                addItemToSale(dataArray);
            }
        },
        listLocation: "items",
        placeholder: "Search by Item ID",
        ajaxSettings: {
            method: "GET",
            dataType: "json",
            data: {
                dataType: "json"
            }
        },

        preparePostData: function(data) {
            data.phrase = $("#item_auto_complete").val();
            return data;
        },

        requestDelay: 300,
        theme: "square"
    };

    $("#item_auto_complete").easyAutocomplete(autoCompleteOptions);

    var rightsaleItemstable = $('#rightSaleItemsTable').DataTable({
        dom: 'Brtp',
        "paginate": false,
        "rowId": 'id',
        "buttons": {
            buttons: [
                {
                    text: 'Delete Seleted Item(s)',
                    action: function () {
                        let arrayID = this.rows( { selected: true }).data().toArray();
                        deleteItems(arrayID);
                    }
                }
            ]
        },
        "columns": [
            {item: "","width": "50px"}, // check box
            {item: "ID", "width": "50px"},	// item id
            {item: "Description", "width": "200px"},	// description
            {item: "Size", "width": "60px"},	// size
            {item: "Price", "width": "75px"}	// real price
        ],
        columnDefs: [
            {title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
            {name: "id", data: "id", orderable: false, targets: 1},
            {name: "description", data: "description", orderable: false, targets: 2},
            {name: "size", data: "size", orderable: false, targets: 3},
            {name: "price", data: "price", orderable: false, targets: 4}
            ],
            select: {
                style:    'multi',
                selector: 'td:first-child'
            },
        order: [[1, 'desc']]
    });

    function deleteItems(rowID) {
        if ( rowID != null) {
            rightsaleItemstable.rows({selected: true}).remove(rowID).draw();
            updateSalesItemsTotals();
        } else {
            Swal.fire(
                'No items are selected',
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

    function addItemToSale(itemData) {
        if ( 1<2) {
            rightsaleItemstable.rows.add(itemData).draw();
            updateSalesItemsTotals();
        } else {
            Swal.fire(
                'No items are selected',
                'Select one or more items first.',
                'warning'
            )
        }
    };

    let updateSalesItemsTotals = function (v) {
        let priceTotal = rightsaleItemstable.column(3).data().sum();
        let totalStr = "<h4>Order Total is : $" + priceTotal.toString() + "</h4>";
        $("#order-total-panel").html(totalStr);
    };

    let commitSale = function (idArray) {
        let convertedArray = JSON.stringify(idArray, null, 4);
        // empty string will be '[]'
        if (idArray.toString().length < 2) {
            Swal.fire(
                'No items were added!',
                'Add one or more items to sale first.',
                'error'
            )
        } else {
            $.ajax({
                type: "POST",
                url: "/sale_items/commit_sale",
                data: convertedArray,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    updateSalesItemsHeader();
                    console.log("successfully posted sale items")
                },
                error: function (data) {
                    alert("things are broken : " + JSON.stringify(data, null, 4));
                }
            })
        }
    };

    window.onload = function () {
        rightsaleItemstable.rows().remove().draw();
        updateSalesItemsTotals();
    };
});