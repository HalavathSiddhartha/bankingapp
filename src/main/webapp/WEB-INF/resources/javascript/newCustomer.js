document
	.getElementById("accountForm")
	.addEventListener(
		"submit",
		function(event) {
			var fullName = document.getElementById("fullName").value;
			var address = document.getElementById("address").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var email = document.getElementById("email").value;
			var accountType = document
				.getElementById("accountType").value;
			var initialBalance = document
				.getElementById("balance").value;

			if (fullName.trim() === "" || address.trim() === ""
				|| mobileNo.trim() === ""
				|| email.trim() === ""
				|| accountType.trim() === ""
				|| initialBalance.trim() === "") {
				alert("All fields are required.");
				event.preventDefault();
			}

			if (mobileNo.trim() === "") {
				alert("Mobile No is required.");
				return false;
			} else if (!/^\d{10}$/.test(mobileNo)) {
				alert("Mobile No must be exactly 10 digits.");
				return false;
			} 9

			if (!/\S+@\S+\.\S+/.test(email)) {
				alert("Enter a valid email address.");
				event.preventDefault();
			}

			if (initialBalance.trim() === ""
				|| parseFloat(initialBalance) <= 0) {
				alert("Initial Balance is required and must be non-negative.");
				event.preventDefault();
			}
		});