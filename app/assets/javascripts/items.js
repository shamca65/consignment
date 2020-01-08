$(document).ready(function() {
    $('#itemsDataTable').DataTable({
        "order": [[1, 'desc']],
        "pageLength": 15,
        "dom": "Bfrtip",
        "columns": [
            {"width": "30px"},		// item id
            {"width": "30px"},		// take in date - ordered desc
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
});