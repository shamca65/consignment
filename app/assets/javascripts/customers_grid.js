$(document).ready(function() {
	$('#customersDataTable').dataTable({
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

	$('.dataTables_filter input').attr('data-toggle', 'tooltip')
		.attr('data-placement', 'right')
		.attr('title', 'Search by any term')
		.tooltip();

});