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
    $.post({
        url: "/Account/GetInfor",
        success: function (response) {
            const myArr = JSON.parse(response);
            document.getElementById('first-name').value = myArr.FirstName;
            document.getElementById('mid-name').value = myArr.MidName;
            document.getElementById('last-name').value = myArr.LastName;
            document.getElementById('student-address').value = myArr.Address;
            document.getElementById('student-phone').value = myArr.Phone;
            document.getElementById('student-email').value = myArr.Email;
        }
    });
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
            document.getElementById('message').innerHTML = response;
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