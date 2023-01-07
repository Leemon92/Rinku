var MovementsTable = null;

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



    MovementsActions.InitTable(null);

    $("#btnOk").click(function () {
        $("#modalMessage p").html('');
        $("#modalMessage").modal("hide");
        document.location.reload();
    });
});

var MovementsActions = (function () {
    SetTable = function (tableData) {
        var datajson;
        ajaxHelper($("#hdnGetEmployeeURL").val(), "GET", null, null)
            .done(function (result) {
                datajson = JSON.parse(result);
                console.log(datajson);
            });


        var columns = [
            { title: "EmployeeNumber", field: "EmployeeNumber", headerSort: false, editable: true, visible: true },
            { title: "EmployeeName", field: "EmployeeName", headerSort: false, editable: true, visible: true },
            { title: "Rol", field: "Rol", headerSort: false, editable: true, visible: true },
            { title: "CreationDte", field: "CreationDte", headerSort: false, editable: true, visible: true },
            { title: "Active", field: "Active", headerSort: false, editable: true, visible: true },
            { title: "ID", field: "Active", headerSort: false, editable: true, visible: false },
            { title: "idRol", field: "Active", headerSort: false, editable: true, visible: false },
        ];

        MovementsTable = new Tabulator("#tblEmployes", {
            data: datajson,
            layout: "fitColumns",
            pagination: false,
            placeholder: "No Data Not Found",
            invalidOptionWarnings: false,
            selectable: "highlight",
            columns: columns,
        });


        //EmployeeTable.setLocale("simple");
        //EmployeeTable.setData();

        //if (tableData !== null)
        //    EmployeeTable.setData(tableData);
    };

    return {
        InitTable: SetTable,
    };
}());

function LoadNumberInfo(pObj) {
    try {
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

    }
    catch (issue) {
        console.log("issue .onEmployeJS_Save_New_Employe=" + issue);
    }
}

function Save_New_Movement() {
    try {
        $("#modalMessage p").html('');
        $("#modalMessage").modal("hide");

        if (String($("#txtEmployeName").val()).trim() == '' || String($("#txtEmployeName").val()).trim() == 'undefined') {
            alert("Please, select a employee number.");
            return;
        }

        if (Number($("#cmbxMonth").val()) <= 0) {
            alert("Please, select a a month.");
            return;
        }

        if (String($("#txtQty").val()).trim() == '' || String($("#txtQty").val()).trim() == 'undefined') {
            alert("Please, type the quantity.");
            return;
        }

        if (confirm("Are you sure to save?")) {
            var idEmployeSelected = $("#cmbxEmployeeNumber").val()
            var idMonthSelected = $("#cmbxMonth").val()
            var url = $("#hdnCreateMovementURL").val();

            var data = {};
            data["IDEmploye"] = Number(idEmployeSelected);
            data["IDMonth"] = Number(idMonthSelected);
            data["QtyShip"] = String($("#txtQty").val()).trim();

            ajaxFormHelper(url, "POST", data, null, false)
                .done(function (result) {
                    $("#modalMessage p").html('<br>' + String(result.Msg) + '. <br>&nbsp;');
                    $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                    $("#modalMessage").modal("show");
                });
        }
        else
            return false;
    }
    catch (issue) {
        console.log("issue .onEmployeJS_Save_New_Employe=" + issue);
    }
}
