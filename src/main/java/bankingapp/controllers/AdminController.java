package bankingapp.controllers;

import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bankingapp.dao.AdminLoginDao;
import bankingapp.dao.AdminLoginDaoImpl;
import bankingapp.dao.NewAccountDao;
import bankingapp.entity.Admin;
import bankingapp.entity.Customer;

@Controller
public class AdminController {

	/*
	 * Here we are creating the object of the Data access object of Admin login Dao
	 * Point to be noted while doing these the name wch is given to the dao cls here
	 * must be same as that given in spring-servlet.xml wch is the bean of
	 * AdminLoginDao An autowired should be done to establish the connection b/w dao
	 * layer and controller
	 */
	@Autowired
	AdminLoginDao adminLoginDao;
	@Autowired
	NewAccountDao account;

	// ----------------------------------HomePage---------------------------
	@RequestMapping("/")
	public String home() {
		return "homePage";
	}

	// ----------------------------------About---------------------------
	@RequestMapping("/about")
	public String about(Model model) {

		return "about";
	}

	// ----------------------------------URl For Admin Login
	// Page---------------------------
	@GetMapping("/adminLoginPage")
	public String adminLogin() {
		return "adminLoginPage";
	}

	// ----------------------------------New Admin Registration
	// page---------------------------
	@GetMapping("/adminRegPage")
	public String adminReg() {
		return "adminRegPage";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("Admin") Admin admin, Model model, HttpServletRequest request) {
		try {
			int result = adminLoginDao.registerAdmin(admin);
			if (result == 1) {
				HttpSession session = request.getSession();
				model.addAttribute("message", "Registered successfully. Login to continue");
				return "adminLoginPage";
			} else {
				model.addAttribute("message", "Registration failed. Try again");
				return "adminRegPage";
			}
		} catch (DataAccessException ex) {

			model.addAttribute("message", "An error occurred during registration. Please try again later.");
			return "errorPage";
		}
	}
	// ---------------------------------- admin data
	// validation---------------------------

	@PostMapping("/adminLoginProcess")
	public String checkAdmin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest rs) {
		try {
			boolean loginFlag = adminLoginDao.validateAdmin(username, password);
			model.addAttribute("username", username);
			model.addAttribute("password", password);
			if (loginFlag) {
				model.addAttribute("message", "Invalid credentials !!");
				HttpSession session = rs.getSession();
				session.setAttribute("username", adminLoginDao);
				return "adminDashboard";
			} else {
				model.addAttribute("message", "Can't find credentials");
				return "adminLoginPage";
			}
		} catch (DataAccessException ex) {
			model.addAttribute("message", "An error occurred during login. Please try again later.");
			return "errorPage";
		}
	}

	// ----------------------------------method for Creating bank
	// account---------------------------

	@RequestMapping(path = "/newCustomerAccount", method = RequestMethod.GET)
	public String newCustomerAccount() {
		return "newCustomerAccount";
	}

	@RequestMapping("/processNewAccount")
	public String openAccount(@RequestParam("fullName") String fullName, @RequestParam("address") String address,
			@RequestParam("mobileNo") String mobileNo, @RequestParam("email") String email,
			@RequestParam("accountType") String accountType, @RequestParam("initialBalance") int balance, Model model) {
		try {
			if (!mobileNo.matches("\\d{10}")) {
				model.addAttribute("message",
						"Mobile number must contain exactly 10 digits and only numbers has to given.");
				return "errorPage";
			}

			String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
			StringBuilder password = new StringBuilder(10);
			SecureRandom random = new SecureRandom();
			for (int i = 0; i < 10; i++) {
				int randomIndex = random.nextInt(chars.length());
				password.append(chars.charAt(randomIndex));
			}

			Customer newacc = new Customer();
			newacc.setFullName(fullName);
			newacc.setAddress(address);
			newacc.setMobileNo(mobileNo);
			newacc.setEmail(email);
			newacc.setAccountType(accountType);
			newacc.setBalance(balance);
			newacc.setPassword(password.toString());
			model.addAttribute("fullName", fullName);
			model.addAttribute("address", address);
			model.addAttribute("mobileNo", mobileNo);
			model.addAttribute("email", email);
			model.addAttribute("accountType", accountType);
			model.addAttribute("balance", balance);
			model.addAttribute("password", password);
			int result = account.createAccount(newacc);
			int trans = account.fetchAcoount();

			int acct = account.insertIntoAccount(trans, balance);

			if (result == 1) {
				int acc = account.fetchAccountNumber(password.toString());

				model.addAttribute("acc", acc);
				return "accountAddedSucess";
			} else {
				return "errorPage";
			}
		} catch (NumberFormatException ex) {
			model.addAttribute("message", "Invalid balance format. Please enter a valid number.");
			return "errorPage";
		} catch (DataAccessException ex) {
			model.addAttribute("message", "An error occurred during account creation. Please try again later.");
			return "errorPage";
		}
	}

	// ----------------------------------Method for view all
	// accounts---------------------------

	@RequestMapping("/viewAllAccounts")
	public String viewAccounts(Model model) {
		try {
			List<Customer> listOfAccounts = account.viewAllCustomers();
			if (listOfAccounts.isEmpty()) {
				model.addAttribute("message", "No accounts found.");
				return "errorPage";
			}

			model.addAttribute("listOfAccounts", listOfAccounts);
			return "viewAllAccounts";
		} catch (Exception ex) {
			model.addAttribute("message",
					"An error occurred while fetching account information. Please try again later.");
			return "errorPage";
		}
	}

	@RequestMapping("/deleteAccounts")
	public String openDeleteForm() {

//		
		return "deleteAccounts";
	}
	// ----------------------------------Method for Deleting
	// accounts---------------------------

	@RequestMapping("/deleteAccount")
	public String deleteCustomer(@RequestParam("accountNumber") String accountNumberStr, Model model) {
		try {
			int accountNumber = Integer.parseInt(accountNumberStr);

			Customer customer = new Customer();
			customer.setAccountNumber(accountNumber);

			int result = account.deleteAccount(accountNumber);
			if (result == 1) {
				model.addAttribute("message", "Account deleted successfully !!");
				return "deleteAccounts";
			} else {
				model.addAttribute("message", "Account Doesn't Exist or Already Deleted");
				return "deleteAccounts";
			}
		} catch (NumberFormatException ex) {
			model.addAttribute("message", "Invalid account number format. Please enter a valid number.");
			return "errorPage";
		} catch (Exception ex) {
			model.addAttribute("message", "An error occurred while deleting the account. Please try again later.");
			return "errorPage";
		}
	}

	// ----------------------------------Method for Updating
	// acoount---------------------------

	@RequestMapping("/updateaccount")
	public String openupdateaccount() {
		return "updateaccount";
	}

	@RequestMapping("/processUpdateAccount")
	public String updateAccount(@RequestParam("accountNumber") String accountNumberStr,
			@RequestParam("fullName") String fullName, @RequestParam("address") String address,
			@RequestParam("mobileNo") String mobileNo, @RequestParam("email") String email, Model model) {

		try {

			if (!accountNumberStr.matches("\\d+")) {
				model.addAttribute("message", "Invalid account number format. Please enter a valid number.");
				return "errorPage";
			}
			if (!mobileNo.matches("\\d{10}")) {
				model.addAttribute("message",
						"Mobile number must contain exactly 10 digits and only numbers have to be given.");
				return "errorPage";
			}

			int accountNumber = Integer.parseInt(accountNumberStr);

			Customer customer = new Customer();
			customer.setAccountNumber(accountNumber);
			customer.setFullName(fullName);
			customer.setAddress(address);
			customer.setMobileNo(mobileNo);
			customer.setEmail(email);

			int result = account.updateAccount(customer);
			if (result == 1) {
				model.addAttribute("message", "Updation successful!");
				return "updateaccount";
			} else {
				model.addAttribute("message", "Failed to update account. Please check your input.");
				return "updateaccount";
			}
		} catch (NumberFormatException ex) {
			model.addAttribute("message", "Invalid account number format. Please enter a valid number.");
			return "errorPage";
		} catch (Exception ex) {
			model.addAttribute("message", "An error occurred during account update. Please try again later.");
			return "errorPage";
		}
	}

	// ----------------------------------Admin Logout
	// Method---------------------------

	@GetMapping("/logout")
	public String processLogout(HttpSession session, Model attr) {
		try {
			session.invalidate();
			attr.addAttribute("message", "Logged out successfully");
			return "adminLoginPage";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "errorPage";
		}

	}

	@GetMapping("/backtoadmin")
	public String backtoadmin() {
		return "adminDashboard";
	}

}
