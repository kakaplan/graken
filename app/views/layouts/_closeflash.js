alertButton = document.getElementById('alertButton');
if (alertButton != null) {
    alertButton.onclick = function() {
        close('flash-alert');
    }
}


noticeButton = document.getElementById('noticeButton');
if (noticeButton != null) {
    noticeButton.onclick = function() {
        close('flash-notice');
    } 
}

function close(id) {
    element = document.getElementById(id);
    element.style.display = "none";
}