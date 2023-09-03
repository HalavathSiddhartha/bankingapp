function validateForm() {
			var accountNumber = document.getElementById("accountNumber").value;
			var fullName = document.getElementById("fullName").value;
			var address = document.getElementById("address").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var email = document.getElementById("email").value;

			if (accountNumber.trim() === "") {
				alert("Account Number is required.");
				return false;
			}
			if (fullName.trim() === "") {
				alert("Full Name is required.");
				return false;
			}
			if (address.trim() === "") {
				alert("Address is required.");
				return false;
			}
			if (mobileNo.trim() === "") {
				alert("Mobile Number is required.");
				return false;
			}
			if (email.trim() === "") {
				alert("Email is required.");
				return false;
			}

			return true;
		}