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

document.getElementById('edit-btn').addEventListener('click', function () {
    document.querySelectorAll('input[aria-label="disabled"]').forEach(x => {
        x.disabled = false;
    });
    document.getElementById('edit-btn').style = "display: none;";
    document.getElementById('cancel-btn').style = "display: inline-block;";
    document.getElementById('save-btn').style = "display: inline-block;";
});
document.getElementById('cancel-btn').addEventListener('click', function () {
    document.querySelectorAll('input[aria-label="disabled"]').forEach(x => {
        x.disabled = true;
    });
    document.getElementById('edit-btn').style = "display: inline-block;";
    document.getElementById('cancel-btn').style = "display: none;";
    document.getElementById('save-btn').style = "display: none;";
});
document.getElementById('save-btn').addEventListener('click', function () {
    var formData = new FormData(document.getElementById('frm'));
    $.post({
        url: '/Student/UpdateProfile',
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            console.log(response);
        }
    });
    document.querySelectorAll('input[aria-label="disabled"]').forEach(x => {
        x.disabled = true;
    });
    document.getElementById('edit-btn').style = "display: inline-block;";
    document.getElementById('cancel-btn').style = "display: none;";
    document.getElementById('save-btn').style = "display: none;";
});
function checkNumber(item, max) {
    if (item.value > max) {
        item.value = max;
    }
    if (item.value < 1) {
        item.value = 1;
    }
}