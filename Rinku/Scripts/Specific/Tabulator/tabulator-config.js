///////////////////////////////////////////////////
// Documentation page:                           //
// http://tabulator.info/docs/4.1/quickstart     //
///////////////////////////////////////////////////

// selector: create Tabulator on DOM element with the given id or css selector.
// columnsData: array of objects, with each object representing the configuration of one column. Obligatory.
// pagination: number of rows per page.
// selectable: number of rows that can be selected. This parameter can be true/false/any integer value.
// selectedRowEvent: function to execute when click a row.
function StartTabulator(Configuration) {
	var table = new Tabulator(Configuration["selector"], {
		pagination: "local",
		height: "100%",
		paginationSize: (Configuration["pagination"] === undefined) ? 5 : Configuration["pagination"],
		selectable: (Configuration["selectable"] === undefined) ? 0 : Configuration["selectable"],
		rowSelected: function (row) {
			if (Configuration["selectedRowEvent"] !== undefined)
				Configuration.selectedRowEvent(row);
		},
		placeholder: Resources.DataNotFound,
		layout: "fitColumns",
		responsiveLayout: "collapse",
		resizableColumns: "header",
		langs: {
			"simple": {
				"pagination": {
					"first": "<span class='fa fa-angle-double-left'></span>",
					"first_title": "First Page",
					"last": "<span class='fa fa-angle-double-right'></span>",
					"last_title": "Last Page",
					"prev": "<span class='fa fa-angle-left'></span>",
					"prev_title":"Previous Page",
					"next": "<span class='fa fa-angle-right'></span>",
					"next_title": "Next Page",
				},
			}
		},
		columns: Configuration["columnsData"]
	});

	table.setLocale("simple");

	/* Keep table variable alive to manipulate data */
	window["table"] = table;
}

// iconFunction: Icon that will show on a new column
// customFunction: This function will be executed when the user click the icon.
// ¡IMPORTANT! The function will receive the complete object of the row. Use it!
var setIconColumn = function (iconFunction, customFunction) {
	return {
		formatter: iconFunction,
		width: 40,
		hozAlign: "center",
		headerSort: false,
		cellClick: function (e, cell) {
			if (customFunction !== undefined) {

				// Get object from the row
				var object = cell.getRow().getData();

				// Execute the function provided
				// object - data
				// e - event
				// cell - cell component
				customFunction(object, e, cell);
			}
		}
	};
}

/* Variable with HTML tag to show the icon */
var noneIcon = function ()
{
	return "<span class='fa'></span>";
}

var viewIcon = function () {
	return "<span class='fa fa-eye'></span>";
}

var deleteIcon = function () {
	return "<span class='fas fa-trash-alt'></span>";
}

var userIcon = function () {
	return "<span class='fa fa-user'></span>";
}

var creditCardIcon = function () {
	return "<span class='fa fa-credit-card'></span>";
}

var plusIcon = function () {
	return "<span class='fa fa-plus' style='font-size: 10px;'></span>";
}

var minusIcon = function () {
	return "<span class='fa fa-minus' style='font-size: 10px;'></span>";
}

var pencilIcon = function () {
	return "<span class='fas fa-pencil-alt'></span>";
}

var clockIcon = function () {
	return "<span class='fa fa-clock'></span>";
}