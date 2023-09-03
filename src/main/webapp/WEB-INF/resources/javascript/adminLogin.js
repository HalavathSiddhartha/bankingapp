/**
 * 
 */

  var usernameInput = document.getElementById("usernameInput");
    var passwordInput = document.getElementById("passwordInput");
    var usernameError = document.getElementById("usernameError");
    var passwordError = document.getElementById("passwordError");

    usernameInput.addEventListener("input", validateUsername);
    passwordInput.addEventListener("input", validatePassword);

    function validateUsername() {
        if (usernameInput.value === "") {
            usernameError.textContent = "Username is required.";
        } else if (usernameInput.value.length > 20) {
            usernameError.textContent = "Username cannot exceed 20 characters.";
        } else {
            usernameError.textContent = "";
        }
    }

    function validatePassword() {
        var password = passwordInput.value;
        
        if (password === "") {
            passwordError.textContent = "Password is required.";
        } else if (password.length < 8 || password.length > 15) {
            passwordError.textContent = "Password must be between 8 and 15 characters.";
        } else {
            passwordError.textContent = "";
        }
    }

    document.getElementById("loginForm").addEventListener("submit", function(event) {
        validateUsername();
        validatePassword();
        
        if (usernameError.textContent !== "" || passwordError.textContent !== "") {
            event.preventDefault();
        }
    });