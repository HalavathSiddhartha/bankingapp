/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
        const submitButton = document.getElementById("submitBtn");
        const form = document.getElementById("accountForm");
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirmPassword");

        submitButton.addEventListener("click", function(event) {
            const fullName = document.getElementById("fullName").value;
            const username = document.getElementById("username").value;
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (fullName.trim() === "" || username.trim() === "" || password.trim() === "") {
                alert("Please fill in all fields.");
                event.preventDefault();
            } else if (password.length < 8 || password.length > 15) {
                alert("Password must be between 8 and 15 characters.");
                event.preventDefault();
            } else if (password !== confirmPassword) {
                alert("Passwords do not match.");
                event.preventDefault();
            }
        });
    });