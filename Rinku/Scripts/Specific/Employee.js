var EmployeeTable = null;

$(document).ready(function () {
    EmployeeActions.InitTable(null);

    $("#btnOk").click(function () {
        $("#modalMessage p").html('');
        $("#modalMessage").modal("hide");
        document.location.reload();
    });
});

var EmployeeActions = (function () {
    SetTable = function (tableData) {
        var datajson;
        ajaxHelper($("#hdnGetEmployeeURL").val(), "GET", null, null)
            .done(function (result) {
                datajson = JSON.parse(result);
            });

        var columns = [
            { title: "EmployeeNumber", field: "EmployeeNumber", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "EmployeeName", field: "EmployeeName", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "Rol", field: "Rol", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "CreationDte", field: "CreationDte", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "Active", field: "Active", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "ID", field: "Active", headerSort: false, editable: true, visible: false },
            { title: "idRol", field: "Active", headerSort: false, editable: true, visible: false },
        ];

        EmployeeTable = new Tabulator("#tblEmployes", {
            data: datajson,
            layout: "fitColumns",
            pagination: false,
            placeholder: "No Data Not Found",
            invalidOptionWarnings: false,
            selectable: "highlight",
            columns: columns,
        });
    };

    return {
        InitTable: SetTable,
    };
}());

function Save_New_Employe() {
    try {
        $("#modalMessage p").html('');
        $("#modalMessage").modal("hide");

        if (String($("#txtEmployeName").val()).trim() == '' || String($("#txtEmployeName").val()).trim() == 'undefined') {
            alert("Please, type employee name");
            return;
        }

        if (confirm("Are you sure to save?")) {
            var idRolSelected = $("#cmbxRol").val()

            var url = $("#hdnCreateEmployeeURL").val();
            var data = {};
            data["idRol"] = Number(idRolSelected);
            data["Name"] = String($("#txtEmployeName").val()).trim();

            //CREATE EMPLOYEE
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
