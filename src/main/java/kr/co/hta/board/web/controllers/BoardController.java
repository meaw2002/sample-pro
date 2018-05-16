package kr.co.hta.board.web.controllers;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hta.board.service.BoardService;
import kr.co.hta.board.vo.Board;
import kr.co.hta.board.vo.User;
import kr.co.hta.board.web.form.BoardForm;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private String directory = "c:/upload/formfile";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/add.do")
	public String add(BoardForm boardForm, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("LOGIN_USER");
		//System.out.println(boardForm);
		Board board = new Board();
		board.setTitle(boardForm.getTitle());
		board.setContents(boardForm.getContents());
		board.setNick(user.getId());
		
		MultipartFile upfile= boardForm.getUpfile();
		if(!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			System.out.println(filename);
			board.setFilename(filename);
			//
			FileCopyUtils.copy(upfile.getBytes(), new File(directory, filename));
		}
		boardService.addNewBoard(board);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "board/form.jsp";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int boardNo, Model model) {
		Board board = boardService.getBoardDetail(boardNo);
		model.addAttribute("board", board);
		return "board/detail.jsp";
	}
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		List<Board> boards = boardService.getAllBoards();
		model.addAttribute("boards", boards);
		return "board/list.jsp";
	}
}
