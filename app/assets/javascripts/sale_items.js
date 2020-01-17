$(document).ready(function() {

    let tax_rate_a;
    let tax_rate_b;
    let global_order_total;

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
        "dom": 'Btip',
        "paginate": false,
        "rowId": 'id',
        "buttons": {
            buttons: [
                {
                    text: 'Delete Selected Item(s)',
                    action: function () {
                        let arrayID = rightsaleItemstable.rows( { selected: true }).data().toArray();
                        deleteItems(arrayID);
                    }
                }
            ]
        },
        "initComplete": function(settings, json) {
            dt_ready = true;
        },
        "columns": [
            {item: "","width": "50px"}, // check box
            {item: "ID", "width": "50px"},	// item id
            {item: "Description", "width": "200px"},	// description
            {item: "Size", "width": "60px"},	// size
            {item: "Price", "width": "50px"}	// real price
        ],
        columnDefs: [
            {title: "Select", orderable: false, className: 'select-checkbox', targets:   0},
            {name: "id", data: "id", orderable: false, targets: 1},
            {name: "description", data: "description", orderable: false, targets: 2},
            {name: "size", data: "size", orderable: false, targets: 3},
            {name: "price",
                data: "price",
                render: $.fn.dataTable.render.number( ',', '.', 2, '' ),
                orderable: false,
                targets: 4},
            ],
            select: {
                style:    'multi',
                selector: 'td:first-child'
            },
        order: [[1, 'asc']]
    });

    let ten_oclock = function (val){
        alert('this val is : ' + val.toString());
    }

    let deleteItems = function(rowID) {
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
       let itemTotal = rightsaleItemstable.column(4).data().sum();
       let itemTotalStr = "<h5>Item Total is : $" + currency(itemTotal).toString() + "</h5>";
       $("#item-total-panel").html(itemTotalStr);
       //
        let taxCalc_a = (itemTotal * (tax_rate_a));
        let taxCalc_b = (itemTotal * (tax_rate_b));
        let taxTotal = (taxCalc_a+ taxCalc_b);
        let orderTotal = (taxTotal + itemTotal);
        let taxTotalStr = "<h5>Taxes : $" + currency(taxTotal).toString() + "</h5>";
        $("#tax-total-panel").html(taxTotalStr);
        //
        global_order_total = orderTotal;
        let orderTotalStr = "<h4>Order Total : $" + currency(orderTotal).toString() + "</h4>";
        $("#order-total-panel").html(orderTotalStr);

     //   let totalStr = "<h4>Order Total is : $" + priceTotal_curr.toString() + "</h4>";
       // $("#order-total-panel").html(totalStr);
       // let taxTotal_curr = currency(tax_total_a + tax_total_b);
       // let totalStr = "<h4>Item Total is : $" + priceTotal_curr.toString() + "</h4>";
       // let taxTotalStr = "<h4>Tax Total is : $" + taxTotal_curr.toString() + "</h4>";
        //$("#tax-total-panel").html(taxTotalStr);
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

    let pageInit = function () {
        rightsaleItemstable.rows({selected: false}).remove(0).draw();
        tax_rate_a = $("#tax_rate_a").data('var');
        tax_rate_b = $("#tax_rate_b").data('var');
    };

    $(document).ready(pageInit);
    $(document).on('turbolinks:loaded', pageInit);

});

