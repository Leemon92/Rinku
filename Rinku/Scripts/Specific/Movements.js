var CurrentMonths = [];
var allow2Reload = false, usrEditing = false;
var MovementsTable = null;
var PayrollTable = null;

$(document).ready(function () {
    ajaxHelper($("#hdnGetEmployeeURL").val(), "GET", null, null)
        .done(function (result) {
            var datajson = JSON.parse(result);
            var sel = document.getElementById('cmbxEmployeeNumber');
            for (var i = 0; i < datajson.length; i++) {
                var opt = document.createElement('option');
                opt.innerHTML = String(datajson[i].EmployeeNumber);
                opt.value = Number(datajson[i].EmployeeNumber);
                sel.appendChild(opt);
            }
        });

    $("#btnSave").click(function () {
        try {
            allow2Reload = false;
            $("#modalMessage p").html('');
            $("#modalMessage").modal("hide");
            var idMonthSelected = $("#cmbxMonth").val();
            var idEmployeeSelected = $("#cmbxEmployeeNumber").val();

            if (Number(idEmployeeSelected) <= 0 || (String($("#txtEmployeName").val()).trim() == '' || String($("#txtEmployeName").val()).trim() == 'undefined')) {
                $("#modalMessage p").html('<br><p class="text-primary">Please, select a employee number. </p><br>');
                $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                $("#modalMessage").modal("show");
                return;
            }

            if (Number(idMonthSelected) <= 0) {
                $("#modalMessage p").html('<br><p class="text-primary">Please, select a month. </p><br>');
                $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                $("#modalMessage").modal("show");
                return;
            }

            if (String($("#txtQty").val()).trim() == '' || String($("#txtQty").val()).trim() == 'undefined') {
                $("#modalMessage p").html('<br><p class="text-primary">Please, type the quantity. </p><br>');
                $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                $("#modalMessage").modal("show");
                return;
            }

            if (usrEditing === false) {
                if (CurrentMonths.length > 0) {
                    for (var i = 0; i < CurrentMonths.length; i++) {
                        if (Number(CurrentMonths[i].IDEmploye) == Number(idEmployeeSelected) && Number(CurrentMonths[i].IDMonth) == Number(idMonthSelected)) {
                            $("#modalMessage p").html('<br><p class="text-primary">The information you are trying to register already exists, please edit the corresponding record.</p><br>');
                            $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                            $("#modalMessage").modal("show");
                            return;
                        }
                    }
                }
            }

            if (confirm("Are you sure to save?")) {
                var url = $("#hdnSaveMovementURL").val();

                var data = {};
                data["IDEmploye"] = Number(idEmployeeSelected);
                data["IDMonth"] = Number(idMonthSelected);
                data["QtyShip"] = (String($("#txtQty").val()).trim() == '' ? Number(0) : Number($("#txtQty").val()));

                ajaxFormHelper(url, "POST", data, null, false)
                    .done(function (result) {
                        if (String(result.Result).trim() == "Success") {
                            $("#modalMessage p").html('<br><p class="text-success">' + String(result.Msg) + '.</p><br>');
                            allow2Reload = true;
                            usrEditing = false;
                        }
                        else {
                            $("#modalMessage p").html('<br><p class="text-danger">' + String(result.Msg) + '. </p><br>');
                        }
                        $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                        $("#modalMessage").modal("show");
                    });
            }
            else
                return false;
        }
        catch (issue) {
            $("#modalMessage p").html('<br><p class="text-danger">' + String(issue) + '. </p><br>');
            $("#modalMessage").modal({ backdrop: "static", keyboard: false });
            $("#modalMessage").modal("show");
            console.log("issue .onEmployeJS_Save_New_Employe=" + issue);
        }
    });

    $("#btnPayroll").click(function () {
        MovementsActions.InitPayroll(null);
    });

    $("#btnOk").click(function () {
        $("#modalMessage p").html('');
        $("#modalMessage").modal("hide");
        if (allow2Reload === true) { document.location.reload(); }
    });

    $("#btnClose").click(function () {
        $("#modalPayroll").modal("hide");
    });
});

var MovementsActions = (function () {
    SetTable = function (tableData) {
        var datajson;
        var data = {};
        data["IDEmploye"] = Number($("#cmbxEmployeeNumber").val());
        data["IDMonth"] = Number($("#cmbxMonth").val());
        data["QtyShip"] = (String($("#txtQty").val()).trim() == '' ? Number(0) : Number($("#txtQty").val()));

        ajaxHelper($("#hdnGetMovementURL").val(), "GET", data, null)
            .done(function (result) {
                CurrentMonths = [];
                datajson = JSON.parse(result);
                CurrentMonths = [...datajson];
            });

        var columns = [
            { title: "EmployeeNumber", field: "EmployeeNumber", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "EmployeeName", field: "EmployeeName", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "Month", field: "Month", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "Monthly Deliveries", field: "QtyShip", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
        ];

        MovementsTable = new Tabulator("#tblMovements", {
            data: datajson,
            layout: "fitColumns",
            pagination: false,
            selectable: true,
            placeholder: "No Data Not Found",
            columns: columns,
        });

        MovementsTable.on("rowSelectionChanged", function (data, rows) {
            if (data.length > 0) {
                usrEditing = true;
                $("#txtQty").val(String(data[0].QtyShip));
                $("#cmbxMonth").val(Number(data[0].IDMonth));
                MovementsTable.deselectRow();
            }
        });
    };

    SetTablePayroll = function (tableData) {
        var idMonthSelected = $("#cmbxMonth").val();
        var idEmployeeSelected = $("#cmbxEmployeeNumber").val();

        if (Number(idEmployeeSelected) <= 0 || (String($("#txtEmployeName").val()).trim() == '' || String($("#txtEmployeName").val()).trim() == 'undefined')) {
            $("#modalMessage p").html('<br><p class="text-primary">Please, select a employee number. </p><br>');
            $("#modalMessage").modal({ backdrop: "static", keyboard: false });
            $("#modalMessage").modal("show");
            return;
        }

        if (Number(idMonthSelected) <= 0) {
            $("#modalMessage p").html('<br><p class="text-primary">Please, select a month. </p><br>');
            $("#modalMessage").modal({ backdrop: "static", keyboard: false });
            $("#modalMessage").modal("show");
            return;
        }

        var data = {};
        data["IDEmploye"] = Number(idEmployeeSelected);
        data["IDMonth"] = Number(idMonthSelected);

        var datajson;
        ajaxHelper($("#hdnGetPayrollURL").val(), "GET", data, null, true)
            .done(function (result) {
                datajson = JSON.parse(result);
                $("#modalPayroll").modal({ backdrop: "static", keyboard: false });
                $("#modalPayroll").modal("show");                
            });

        var columns = [
            { title: "Number", field: "EmployeeNumber", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "Employee", field: "EmployeeName", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "Rol", field: "Rol", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            { title: "Hours", field: "HoursWorked", headerSort: false, editable: true, visible: true, hozAlign: "center", headerHozAlign: "center" },
            {
                title: "$ Salary", field: "Salary", headerSort: false, visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            { title: "$ Deliveries", field: "PaymentDeliveries", headerSort: false, visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
            }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "$ Bonus", field: "BonusPayment", headerSort: false,  visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "$ Vouchers", field: "FoodVouchers", headerSort: false,  visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "$ Total", field: "Total", headerSort: false,  visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "Tax", field: "Tax", headerSort: false, visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "Extra Tax", field: "ExtraTax", headerSort: false, editable: true, visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
            {
                title: "$ To Pay", field: "AmountToPay", headerSort: false, editable: true, visible: true, formatter: "money", formatterParams: {
                    decimal: ".",
                    thousand: ",",
                    symbol: "$",
                }, hozAlign: "center", headerHozAlign: "center"
            },
        ];

        PayrollTable = new Tabulator("#tblPayroll", {
            data: datajson,
            layout: "fitColumns",
            pagination: false,
            selectable: false,
            placeholder: "No Data Not Found",
            columns: columns,
        });
    };
    return {
        InitTable: SetTable,
        InitPayroll: SetTablePayroll,
    };
}());

function LoadNumberInfo(pObj) {
    try {
        $("#txtEmployeNumber").val('');
        $("#txtEmployeName").val('');
        $("#txtEmployeRol").val('');
        $("#txtQty").val('');
        $("#cmbxMonth").val(0)

        var url = $("#hdnGetEmployeeIDURL").val();
        var idEmployeSelected = pObj.value;

        if (Number(idEmployeSelected) <= 0) {
            return;
        }

        var data = {};
        data["Number"] = Number(idEmployeSelected);

        ajaxFormHelper(url, "GET", data, null, true)
            .done(function (result) {
                var datajson = JSON.parse(result);
                $("#txtEmployeName").val(String(datajson[0].Name).trim().toUpperCase());
                $("#txtEmployeRol").val(String(datajson[0].Rol).trim().toUpperCase());
            });

        MovementsActions.InitTable(null);
    }
    catch (issue) {
        $("#modalMessage p").html('<br><p class="text-danger">' + String(issue) + '. </p><br>');
        $("#modalMessage").modal({ backdrop: "static", keyboard: false });
        $("#modalMessage").modal("show");
        console.log("issue .onEmployeJS_LoadNumberInfo=" + issue);
    }
}
