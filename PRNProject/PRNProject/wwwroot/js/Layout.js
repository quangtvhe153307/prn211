$(document).ready(function () {
    $.post({
        url: "/Account/GetAccount",
        success: function (response) {
            //var result = JSON.parse(response);
            //console.log(response);
            document.getElementById('acc-name').innerHTML = response;
        }
    });
});