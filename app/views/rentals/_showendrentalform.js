var endRentalForm = document.getElementById("end-rental-form");
var endRentalButton = document.getElementById("ready-to-return-button");
endRentalForm.style.display = "none";
function showEndRentalForm() {
    endRentalForm.style.display = "inline";
    endRentalButton.style.display = "none";
}
