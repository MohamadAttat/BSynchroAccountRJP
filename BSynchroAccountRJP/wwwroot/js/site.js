// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.



/**
 * bootstrap types
 * type: primary
 * type: secondary
 * type: success
 * type: danger
 * type: warning
 * type: info
 * 
 * @param {any} type
 * @param {any} message
 */
function ShowMessage(type = "success", message = "") {
    $("#alert-holder").html(`<div class= "alert alert-${type}" role = "alert">${message}</div> `)
    $("#alert-holder").css("display", "block");
    setTimeout(function () {
        $("#alert-holder").css("display", "none");
        $("#alert-holder").html("");
    }, 5000)
}