package com.company.view;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.biz.book.BookVO;
import com.company.biz.book.CalcPage;
import com.company.biz.book.impl.BookService;
import com.company.biz.rental.Impl.RentalService;

@Controller
public class ManagerController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/getBookListManage.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String getBookList(BookVO vo,Model model) {
		System.out.println("(컨트롤러)글 목록 관리자 검색 처리");
		if(vo.getSearchCondition()==null)
			vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword()==null)
			vo.setSearchKeyword("");
		
		
		CalcPage calc=new CalcPage(bookService.selectBoardCount(vo),vo.getPageNum());
		Map<String, Integer> map=calc.calc();
		//수정할 곳
		vo.setStartList(map.get("startList"));
		//페이지 번호가 전체페이지 번호(값)를 초과하면 발생하는 예외처리
		if(map.get("totalPages")<vo.getPageNum()){
			vo.setPageNum(map.get("totalPages"));
		}
		System.out.println(vo.toString());
		System.out.println("====> 게시판 갯수 : "+bookService.selectBoardCount(vo));
		System.out.println("총 페이지 : "+map.get("totalPages"));
		System.out.println("시작 페이지 : "+map.get("startPage"));
		System.out.println("마지막 페이지 : "+map.get("endPage"));
		model.addAttribute("bookList", bookService.getBookList(vo));
		model.addAttribute("map",map);
		model.addAttribute("vo",vo);
		
		return "manageBookList";
	}
	
	@RequestMapping("/updateBook.do")
	public String updateBook(BookVO vo) {
		System.out.println("updateBook by GET");
		bookService.updateBook(vo);
		return "redirect:getBookListManage.do";
	}
	
	@RequestMapping("/getBookManage.do")
	public String getBook(BookVO vo,Model model) {
		model.addAttribute("book", bookService.getBook(vo));
		
		return "manageBook";
	}
	
	@RequestMapping("/deleteBook.do")
	public String deleteBook(BookVO vo) {
		bookService.deleteBook(vo);
		
		return "redirect:getBookListManage.do";
	}
	
	@RequestMapping("/insertBookPage.do")
	public String goToBoardPage() {
		return "insertBook";
	}
}
