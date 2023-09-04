package bankingapp.test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.ui.Model;
import bankingapp.controllers.AdminController;
import bankingapp.dao.AdminLoginDao;
import bankingapp.dao.NewAccountDao;
import bankingapp.entity.Admin;
import static org.mockito.ArgumentMatchers.eq;

public class AdminControllerTest {

	private AdminController adminController;

	private AdminLoginDao adminLoginDao;
	private NewAccountDao newAccountDao;
	private Model model;
	private HttpSession session;
	private HttpServletRequest request;

	@BeforeEach
	public void setUp() {
		adminLoginDao = mock(AdminLoginDao.class);
		newAccountDao = mock(NewAccountDao.class);
		model = mock(Model.class);
		session = mock(HttpSession.class);
		request = mock(HttpServletRequest.class);

		adminController = new AdminController(adminLoginDao, newAccountDao);
	}

	@Test
	public void testHome() {
		String viewName = adminController.home();
		assertEquals("homePage", viewName);
	}

	@Test
	public void testAbout() {
		String viewName = adminController.about(model);
		assertEquals("about", viewName);
	}

	@Test
	public void testAdminLogin() {
		String viewName = adminController.adminLogin();
		assertEquals("adminLoginPage", viewName);
	}

	@Test
	public void testAdminReg() {
		String viewName = adminController.adminReg();
		assertEquals("adminRegPage", viewName);
	}

	@Test
	public void testLogout() {
		String viewName = adminController.processLogout(session, model);
		assertEquals("adminLoginPage", viewName);
		verify(session).invalidate();
		verify(model).addAttribute("message", "Logged out successfully");
	}

	@Test
	public void testAdminLoginSuccess() {
	    when(adminLoginDao.validateAdmin(eq("adminUsername"), eq("adminPassword"))).thenReturn(true);
	    
	    String viewName = adminController.checkAdmin("adminUsername", "adminPassword", model, request); 
	    
	    assertEquals("adminDashboard", viewName); 
	    verify(model).addAttribute("message", "Login successful");
	}

	@Test
	public void testAdminLoginInvalidCredentials() {
	    when(adminLoginDao.validateAdmin(eq("invalidUsername"), eq("invalidPassword"))).thenReturn(false);

	    String viewName = adminController.checkAdmin("invalidUsername", "invalidPassword", model, request);

	    assertEquals("adminLoginPage", viewName);
	    verify(model).addAttribute("message", "Invalid credentials");
	}

}
