
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var deleteAccountForm = document
									.getElementById("deleteAccountForm");
							var accountNumberInput = document
									.getElementById("accountNumber");
							var accountNumberError = document
									.getElementById("accountNumberError");

							deleteAccountForm
									.addEventListener(
											"submit",
											function(event) {
												var accountNumber = accountNumberInput.value;

												if (accountNumber.trim() === "") {
													accountNumberError.textContent = "Account Number is required.";
													event.preventDefault();
												} else {
													accountNumberError.textContent = "";
												}
											});
						});
