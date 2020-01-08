$(document).ready(function() {
    $('#customersDataTable').DataTable({
        "pageLength": 10,
        "dom": "Bfrtip",
        "columns": [
            {"width": "50px"},    // customer id
            {"width": "30px"},    // last updated date
            {"width": "30px"},    // acct open date
            {"width": "120px"},   // customer name link
            {"width": "75px"},    // agreement status
            {"width": "75px"},    // phone
            {"width": "75px"},    // email
            {"width": "50px"},    // province
            {"width": "75px"}     // delete button
        ]
    });
});