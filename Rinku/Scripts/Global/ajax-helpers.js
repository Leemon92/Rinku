/** Generic AJAX 
*   @param {String} url Url target.
*   @param {String} method Type of request: "GET", "POST", "PUT"...
*   @param {Object} data Data type DOM sent to the server.
*   @param {Object} headers Data type request headers sent to server. Not required argument. Default: null.
*   @returns {Object} An object jqXHR
*/
function ajaxFormHelper(url, method, data, headers, pasync) {
    return $.ajax({
        url: url,
        type: method,
        //dataType: "json",
        //async: pasync,
        //contentType: false, 
        data: data ? data : null,
        //processData: false,
        //headers: headers ? headers : null,
        cache: false,
        beforeSend: function () {

        },
        statusCode: {
            400: function (jqXHR, textStatus, errorThrown) {

            },
            401: function (jqXHR, textStatus, errorThrown) {

            }
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {

    });
}

function ajaxHelper(url, method, data, headers) {
    return $.ajax({
        url: url,
        type: method,
         async: false,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: data ? data : null,
        headers: headers ? headers : null,
        cache: false,
        statusCode: {
            400: function (jqXHR, textStatus, errorThrown) {

            },
            401: function (jqXHR, textStatus, errorThrown) {

            }
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {

    });
}