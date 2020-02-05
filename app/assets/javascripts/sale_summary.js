$(document).ready(function() {

    let tax_rate_a;
    let tax_rate_b;
    let global_order_total = 0;
    let itemTotalStr = "<h5>Items : $<b>" + "</b></h5>";
    let taxTotalStr = "<h5>Taxes : $<b>" + "</b></h5>";
    let orderTotalStr = "<h4>Order Total : $<b>" + "</b></h4>";

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

    let saleSummaryTable = $('#saleSummaryTable').DataTable({
        "dom": '<"toolbar"> Btip',
        "paginate": false,
        "rowId": 'id',
        "buttons": {
            buttons: [
                {
                    text: 'Print Receipt',
                    action: function ( ) {
                        window.print();
                        setTimeout("window.close()", 100);
                    }
                }
            ]
        },
        "columns": [
            {item: "Description", "width": "100px"},	// description
            {item: "Gender", "width": "60px"},	// size
            {item: "Type", "width": "60px"},	// size
            {item: "Size", "width": "60px"},	// size
            {item: "Price", "width": "50px"},	// real price
        ],
        "columnDefs": [
            {name: "description", data: "description", orderable: false, targets: 0},
            {name: "gender", data: "gender", orderable: false, targets: 1},
            {name: "type", data: "type", orderable: false, targets: 2},
            {name: "size", data: "size", orderable: false, targets: 3},
            {name: "price",
                data: "price",
                render: $.fn.dataTable.render.number( ',', '.', 2, '$' ),
                orderable: false,
                targets: 4}
            ]
    });

    let setTotals = function(){
        $("#item-total-panel").html(itemTotalStr);
        $("#tax-total-panel").html(taxTotalStr);
        $("#order-total-panel").html(orderTotalStr);
    };

    let unsetElements = function() {
        $("#item_auto_complete").val("");
        $("#paymentReceived").val("");
        $("#cashPortion").val("");
        $("#paymentBalance").val("");
        taxTotalStr = "<h5>Taxes : $<b>" + "</b></h5>";
        itemTotalStr = "<h5>Items : $<b>" + "</b></h5>";
        orderTotalStr = "<h4>Order Total : $<b>" + "</b></h4>";
        setTotals();
    };

    let calculateTaxes = function(itemTotal) {
        let taxCalc_a = (itemTotal * (tax_rate_a));
        let taxCalc_b = (itemTotal * (tax_rate_b));
        return (taxCalc_a + taxCalc_b);
    };

    let updateSalesItemsTotals = function (v) {
       let itemTotal = rightsaleItemstable.column(4).data().sum();
       let taxTotal = calculateTaxes(itemTotal);
       let orderTotal = (taxTotal + itemTotal);
       global_order_total = orderTotal;
        //
       itemTotalStr = "<h5>Items : $<b>" + currency(itemTotal).toString() + "</b></h5>";
       taxTotalStr = "<h5>Taxes : $<b>" + currency(taxTotal).toString() + "</b></h5>";
       orderTotalStr = "<h4>Order Total : $<b>" + currency(orderTotal).toString() + "</b></h4>";
       $("#paymentBalance").val(global_order_total.toFixed(2));
       setTotals();
       managePaymentControls();
    };

    let pageInit = function () {
        rightsaleItemstable.rows({selected: false}).remove().draw();
        $("#paymentLabel").html("<label>Balance owing:</label>");
        tax_rate_a = $("#tax_rate_a").data('var');
        tax_rate_b = $("#tax_rate_b").data('var');
        unsetElements();
        managePaymentControls();
    };

    $(document).ready(pageInit);
    $(document).on('turbolinks:loaded', pageInit);

});

