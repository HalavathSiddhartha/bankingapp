function validateForm() {
			var accountNumber = document.forms["forgotPasswordForm"]["accountNumber"].value;
			var newPassword = document.forms["forgotPasswordForm"]["newPassword"].value;
			var confirmPassword = document.forms["forgotPasswordForm"]["confirmPassword"].value;

			if (accountNumber === "") {
				alert("Please enter your account number");
				return false;
			}

			if (newPassword === "") {
				alert("Please enter a new password");
				return false;
			}

			if (confirmPassword === "") {
				alert("Please confirm your new password");
				return false;
			}

			if (newPassword !== confirmPassword) {
				alert("Passwords do not match");
				return false;
			}
		}