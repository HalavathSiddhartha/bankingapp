package bankingapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bankingapp.dao.TransDao;
import bankingapp.dao.UserDao;
import bankingapp.entity.Cust_detail;
import bankingapp.entity.Customer;

@Controller
public class CustomerController {
	@Autowired
	TransDao transdao;
	@Autowired
	UserDao userDao;

	@RequestMapping("/customerLogin")

	public String customoerLogin() {

		return "customerLogin";
	}

	@RequestMapping(path = "/custvalid", method = RequestMethod.POST)
	public String getdataForm(@RequestParam("accountNumber") int accountNumber,
			@RequestParam("password") String password, Model m, HttpServletRequest rs) {
//		try {
			Customer cust = new Customer();
			cust.setPassword(password);
			cust.setAccountNumber(accountNumber);

			boolean loginFlag = userDao.valid(cust);

			m.addAttribute("accountNumber", accountNumber);
			m.addAttribute("password", password);

			if (loginFlag) {
				int accountBalance = transdao.checkBalance(accountNumber);
				m.addAttribute("balance", accountBalance);
				HttpSession session = rs.getSession();
				session.setAttribute("user", cust);
				return "customerDashboard";
			} else {
				m.addAttribute("message", "Invalid Credential");
				return "customerLogin";
			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			m.addAttribute("message", "An error occurred while processing your request.");
//			return "errorPage";
//		}
	}

	@RequestMapping(path = "/customerDashboard")
	public String customerDashboard(HttpSession session) {
//		try {
			int balance = (Integer) session.getAttribute("balance");
			Customer cust = (Customer) session.getAttribute("user");
			if (cust != null) {
				return "customerDashboard";
			} else {
				return "customerLogin";
			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			return "errorPage";
//		}
	}

	@RequestMapping("/forgetPassword")
	public String forgetDashboard() {
		return "forgetPass";
	}

//	 -----------------Reset Password ---------------------

	@RequestMapping(path = "/resetPassword", method = RequestMethod.POST)
    public String forgetPassword(@RequestParam("accountNumber") String accountNumber,
                                 @RequestParam("newPassword") String newPassword,@RequestParam("oldPassword") String oldPassword,
                                 Model m) {
//        try {
            Customer cs = new Customer();
            
            
            cs.setPassword(oldPassword);
            cs.setAccountNumber(Integer.parseInt(accountNumber));
          boolean val=  userDao.valid(cs);   
            if ( val==true) {
            	
            	 cs.setAccountNumber(Integer.parseInt(accountNumber));
            	 cs.setPassword(newPassword);
            	 int res = userDao.updatePass(cs);
                return "customerLogin";
            } else {
                m.addAttribute("message", "Error.Old Password Must be Same .");
                return "forgetPass";
            }
            
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            m.addAttribute("message", "An error occurred while processing your request.");
//            return "errorPage";
//        }
    }

	// --------------Logout--------------------
	@GetMapping("/customerlogout")
    public String processLogout(HttpSession session, Model attr) {
//        try {
            session.invalidate();
            attr.addAttribute("result", "Logged out successfully");
            return "customerLogin";
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            return "errorPage";
//        }
    }
}
