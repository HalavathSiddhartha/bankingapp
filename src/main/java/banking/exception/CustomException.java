package banking.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class CustomException {
	
	@ResponseStatus(value=HttpStatus.BAD_REQUEST)
	@ExceptionHandler(value = NumberFormatException.class)
	public String numberformat(Model m) {
		m.addAttribute("message","Number Format Exception Occur");
		return "errorPage";
	}
	
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NullPointerException.class)
	public String nullPointer(Model m) {
		m.addAttribute("message","Null Pointer Exception Occur");
		return "errorPage";
	}
	@ResponseStatus(value=HttpStatus.BAD_REQUEST)
	@ExceptionHandler(value = DataAccessException.class)
	public String datAccess(Model m) {
		m.addAttribute("message","Data Access Exception Occur");
		return "errorPage";
	}
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = Exception.class)
	public String genericException(Model m) {
		m.addAttribute("message","some Exception Occur");
		return "errorPage";
	}
}
