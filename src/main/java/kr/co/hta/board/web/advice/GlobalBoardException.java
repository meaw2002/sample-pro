package kr.co.hta.board.web.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.co.hta.board.exception.SimpleBoardException;

@ControllerAdvice	//주로 예외처리를 할때 사용
public class GlobalBoardException {
	//심플보드익셉션이 발생했을때
	@ExceptionHandler(SimpleBoardException.class)
	public String handleException(SimpleBoardException ex) {
		ex.printStackTrace();
		return "error/500.jsp";
	}
	
	//내가 예상못한 익셉션이 발생했을때
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		ex.printStackTrace();
		return "error/500.jsp";
	}
}
