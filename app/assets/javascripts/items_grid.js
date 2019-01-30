$(document).ready(function() {
	$('#itemsDataTable').dataTable({
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

	$('.dataTables_filter input').attr('data-toggle', 'tooltip')
		.attr('data-placement', 'right')
		.attr('title', 'Search by any term')
		.tooltip();

});