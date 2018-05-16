package kr.co.hta.board.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hta.board.dao.BookDao;
import kr.co.hta.board.service.BookService;
import kr.co.hta.board.vo.Book;
import kr.co.hta.board.vo.Criteria;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	BookService bookService;
	
	@RequestMapping("/ajax.do")
	public @ResponseBody Map<String, Object> ajax(Criteria c) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Book> books = bookService.searchBooks(c);
		if(books.isEmpty()) {
			map.put("success", false);
		} else {
			map.put("success", true);
			map.put("items", books);
		}
		//System.out.println(map);
		return map;
	}
	
	@RequestMapping("/search.do")
	public String result(Criteria values, Model model) {
		List<Book> books = bookService.searchBooks(values); 
		//System.out.println(books);
		model.addAttribute("books", books);
		
		return "book/result.jsp";
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "book/form.jsp";
	}
}
