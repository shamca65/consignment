$(document).ready(function() {
    $('#customerItemsDataTable').DataTable({
        "pageLength": 10,
        "dom": '<"toolbar"> Bfrtip',
        "buttons": {
            buttons: [
                {
                    text: 'Takein Items',
                    action: function () {
                        window.location.replace("/");
                    }
                }
            ]
        },
        "columns": [
            {"width": "20px"},		// item id
            {"width": "125px"},		// take in
            {"width": "20px"},		// description
            {"width": "20px"},		// gender
            {"width": "20px"},		// type
            {"width": "100px"},    // size
            {"width": "50px"},    // price
            {"width": "50px"},     // status
            {"width": "20px"}     // history
        ]
    });
});