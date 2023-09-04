package bankingapp.test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.ui.Model;


import bankingapp.controllers.AccountController;
import bankingapp.dao.TransDao;
import bankingapp.entity.Customer;
import bankingapp.entity.Transcation;

public class AccountControllerTest {

	private AccountController accountController;
	private TransDao transDao;
	private Model model;
	private HttpSession session;

	@BeforeEach
	public void setUp() {
		transDao = mock(TransDao.class);
		model = mock(Model.class);
		session = mock(HttpSession.class);

		accountController = new AccountController();
		accountController.transdao = transDao;
	}

	@Test
	public void testAddPage() {
		String viewName = accountController.add(session);

		assertEquals("addMoney", viewName);
	}

	@Test
	public void testWithdrawPage() {
		String viewName = accountController.withdraw();

		assertEquals("withdrawMoney", viewName);
	}

	@Test
    public void testCloseAccountWithBalance() {
        when(transDao.checkBalance(anyInt())).thenReturn(1000);

        Model m = mock(Model.class);
        String viewName = accountController.closeAccount(123, m);

        assertEquals("customerDashboard", viewName);
        verify(m).addAttribute(eq("message"), eq("Action Cannot be performed untill balance is withdrawn"));
        verify(m).addAttribute(eq("balance"), eq(1000));
    }

	@Test
    public void testCloseAccountWithZeroBalance() {
        when(transDao.checkBalance(anyInt())).thenReturn(0);
        when(transDao.closeAccount(anyInt())).thenReturn(1);

        Model m = mock(Model.class);
        String viewName = accountController.closeAccount(123, m);

        assertEquals("customerLogin", viewName);
        verify(m).addAttribute(eq("message"), eq("Your Account Has Been Closed"));
    }

	@Test
	public void testViewTransactions() {
		List<Transcation> transactions = new ArrayList<>();
		when(transDao.checkBalance(anyInt())).thenReturn(1000);
		when(transDao.getColumnNames(anyInt())).thenReturn(transactions);

		Model model = mock(Model.class);
		String viewName = accountController.listTransactions(123, model);

		assertEquals("customertransacation", viewName);
		verify(model).addAttribute(eq("balance"), eq(1000));
		verify(model).addAttribute(eq("transactions"), eq(transactions));
		verify(model).addAttribute(eq("accountNumber"), eq(123));
	}

	@Test
    public void testDeposit() {
        when(session.getAttribute("user")).thenReturn(new Customer()); 
        when(transDao.addmoney(anyInt(), anyInt())).thenReturn(1);

        Model m = mock(Model.class);
        String viewName = accountController.deposit(123, 500, m, session);

        assertEquals("customerDashboard", viewName);
        verify(m).addAttribute(eq("balance"), anyInt());
        verify(m).addAttribute(eq("message"), eq("Transaction successful"));
    }

}
