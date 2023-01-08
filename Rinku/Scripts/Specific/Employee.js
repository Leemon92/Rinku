var EmployeeTable = null;

$(document).ready(function () {
    EmployeeActions.InitTable(null);

    $("#btnSave").click(function () {
        try {
            $("#modalMessage p").html('');
            $("#modalMessage").modal("hide");
            var idRolSelected = $("#cmbxRol").val()

            if (String($("#txtEmployeName").val()).trim() == '' || String($("#txtEmployeName").val()).trim() == 'undefined') {
                alert("Please, type employee name");
                return;
            }

            if (Number(idRolSelected) <= 0) {
                alert("Please, select a rol");
                return;
            }

            if (confirm("Are you sure to save?")) {
                var url = $("#hdnUpdEmployeeURL").val();

                if (String($("#txtEmployeNumber").val()).trim() == '' || String($("#txtEmployeNumber").val()).trim().toLowerCase() == 'undefined') {
                    url = $("#hdnCreateEmployeeURL").val();
                }

                var data = {};
                data["Number"] = Number($("#txtEmployeNumber").val());
                data["idRol"] = Number(idRolSelected);
                data["Name"] = String($("#txtEmployeName").val()).trim();
                data["Active"] = (document.getElementById('chbxActive').checked ? 1 : 0);

                ajaxFormHelper(url, "POST", data, null, false)
                    .done(function (result) {
                        if (String(result.Result).trim() == "Success") {
                            $("#modalMessage p").html('<br><p style="color:green">' + String(result.Msg) + '.</p><br>');
                        }
                        else {
                            $("#modalMessage p").html('<br><p style="color:red">' + String(result.Msg) + '. </p><br>');
                        }                        
                        $("#modalMessage").modal({ backdrop: "static", keyboard: false });
                        $("#modalMessage").modal("show");
                    });
            }
            else
                return false;
        }
        catch (issue) {
            $("#modalMessage p").html('<br><p style="color:red">' + String(issue) + '. </p><br>');
            $("#modalMessage").modal({ backdrop: "static", keyboard: false });
            $("#modalMessage").modal("show");
            console.log("issue .onEmployeJS_Save_New_Employe=" + issue);
        }
    });

    $("#btnClean").click(function () {
        $("#txtEmployeNumber").val('');
        $("#txtEmployeName").val('');
        $("#cmbxRol").val(0)
        document.getElementById('chbxActive').checked = false;
    });

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
            { title: "Status", field: "Active", headerSort: false, editable: true, visible: true, hozAlign: "center" },
            { title: "idActive", field: "Active", headerSort: false, editable: true, visible: false },
            { title: "ID", field: "Active", headerSort: false, editable: true, visible: false },
            { title: "idRol", field: "Active", headerSort: false, editable: true, visible: false },
        ];

        EmployeeTable = new Tabulator("#tblEmployes", {
            data: datajson,
            layout: "fitColumns",
            pagination: false,
            selectable: true,
            placeholder: "No Data Not Found",
            invalidOptionWarnings: false,
            columns: columns,
        });

        EmployeeTable.on("rowSelectionChanged", function (data, rows) {
            if (data.length > 0) {
                $("#txtEmployeNumber").val(String(data[0].EmployeeNumber));
                $("#txtEmployeName").val(String(data[0].EmployeeName));
                $("#cmbxRol").val(Number(data[0].idRol));
                if (data[0].idActive === true) { document.getElementById('chbxActive').checked = true; }
                else { document.getElementById('chbxActive').checked = false; }
                EmployeeTable.deselectRow();
                //EmployeeTable.selectRow(Number(rows[0]._row.position));
            }
        });
    };

    return {
        InitTable: SetTable,
    };
}());