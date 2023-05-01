package com.application.ccpms.contact.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccpms.contact.dto.Contact_boardDTO;
import com.application.ccpms.contact.dto.Contact_replyDTO;
import com.application.ccpms.contact.service.ContactService;
import com.application.ccpms.member.dto.MemberDTO;

@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private ContactService contactService;
	
	@GetMapping("/FAQ")
	public ModelAndView FAQ() throws Exception{
		return new ModelAndView("/contact/FAQ");
	}
	
	@GetMapping("/contactNotice")
	public ModelAndView contactNotice(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/contact/contactNotice");
		
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchKeyword == null) searchKeyword = "total";
		
		String searchWord = request.getParameter("searchWord");
		if(searchWord == null) searchWord = "";
		
		int onePageViewCnt = 5;
		if(request.getParameter("onePageViewCnt") != null) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}
		String temp = request.getParameter("currentPageNumber");
		if(temp == null) {
			temp = "1";
		}
		int currentPageNumber = Integer.parseInt(temp);
		
		Map<String, String> searchCntMap = new HashMap<String, String>();
		searchCntMap.put("searchKeyword", searchKeyword);
		searchCntMap.put("searchWord", searchWord);
		
		int allBoardCnt = contactService.getAllBoardCnt(searchCntMap);
		int allPageCnt = allBoardCnt/onePageViewCnt + 1;
		if(allBoardCnt%onePageViewCnt == 0) allPageCnt--;
		
		int startPage = (currentPageNumber - 1) / 10 * 10 + 1;
		if(startPage == 0) {
			startPage = 1;
		}
		int endPage = startPage + 9;
		if(endPage >= allBoardCnt) endPage = allPageCnt;
		
		int startBoardIdx = (currentPageNumber - 1) * onePageViewCnt;
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("allBoardCnt", allBoardCnt);
		mv.addObject("allPageCnt", allPageCnt);
		mv.addObject("onePageViewCnt", onePageViewCnt);
		mv.addObject("currentPageNumber", currentPageNumber);
		mv.addObject("startBoardIdx", startBoardIdx);
		mv.addObject("searchKeyword", searchKeyword);
		mv.addObject("searchWord", searchWord);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("onePageViewCnt", onePageViewCnt);
		searchMap.put("startBoardIdx", startBoardIdx);
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchWord", searchWord);
		mv.addObject("boardList", contactService.getBoardList(searchMap));
		
		return mv;
	}
	
	@GetMapping("/addBoard")
	public ModelAndView addBoard() throws Exception{
		return new ModelAndView("/contact/addBoard");
	}
	
	@PostMapping("/addBoard")
	public ResponseEntity<Object> addBoard(Contact_boardDTO boardDTO, HttpServletRequest request) throws Exception{
		
		contactService.addBoard(boardDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('게시글을 등록하였습니다.');";
				jsScript += " location.href='" +request.getContextPath()+ "/contact/contactNotice';";	
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/contactDetail")
	public ModelAndView boardDetail(@RequestParam("boardId") long boardId, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/contact/contactDetail");

		Contact_boardDTO boardDTO = contactService.getBoardDetail(boardId, true);
		
		mv.addObject("boardDTO", boardDTO);
		mv.addObject("allReplyCnt", contactService.getAllReplyCnt(boardId));
		mv.addObject("replyList", contactService.getReplyList(boardId));
		
		return mv;
	}
	
	
	@GetMapping("/contactModify")
	public ModelAndView contactModify (@RequestParam("boardId") long boardId) throws Exception{
		ModelAndView mv = new ModelAndView("/contact/contactModify");
		mv.addObject("boardDTO", contactService.getBoardDetail(boardId, false));
		
		return mv;
	}
	
	@PostMapping("/contactModify")
	public ResponseEntity<Object> contactModify(Contact_boardDTO boardDTO, HttpServletRequest request) throws Exception{
		
		contactService.modifyBoard(boardDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('게시글을 수정하였습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/contact/contactDetail?boardId=" + boardDTO.getBoardId() + "';";	
				jsScript += "</script>";
		

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/contactRemove")
	public ModelAndView contactRemove(@RequestParam("boardId") long boardId) throws Exception{
		ModelAndView mv = new ModelAndView("/contact/contactRemove");
		mv.addObject("boardDTO", contactService.getBoardDetail(boardId, false));
		
		return mv;
	}
	
	@PostMapping("/contactRemove")
	public ResponseEntity<Object> contactRemove(Contact_boardDTO boardDTO , HttpServletRequest request) throws Exception{
		
		String jsScript = "";
		
		HttpSession session = request.getSession();
		
	    String role = (String) session.getAttribute("role");
	    
	    if ("client".equals(role)) {
	    	if(contactService.removeBoard(boardDTO)) {
				jsScript = "<script>";
				jsScript += " alert('게시글을 삭제하였습니다.');";
				jsScript += " location.href='" +request.getContextPath()+ "/contact/contactNotice';";	
				jsScript += "</script>";
			}
	    	else {
				jsScript = "<script>";
				jsScript += " alert('비밀번호를 확인하세요.');";
				jsScript += "history.go(-1);";	
				jsScript += "</script>";
			}
	    }
	    else {
	    	contactService.adminRemoveBoard(boardDTO);
	    	jsScript = "<script>";
			jsScript += " alert('게시글을 삭제하였습니다.');";
			jsScript += " location.href='" +request.getContextPath()+ "/contact/contactNotice';";	
			jsScript += "</script>";
	    }
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@PostMapping("/addReply")
	public ResponseEntity<Object> addReply(Contact_replyDTO replyDTO, HttpServletRequest request) throws Exception{
		
		contactService.addReply(replyDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('댓글을 등록하였습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/contact/contactDetail?boardId=" + replyDTO.getBoardId() + "';";	
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@GetMapping("/replyModify")
	public ModelAndView replyModify(@RequestParam("replyId") long replyId) throws Exception{
		ModelAndView mv = new ModelAndView("/contact/replyModify");
		mv.addObject("replyDTO", contactService.getReplyDetail(replyId));
		
		return mv;
	}
	
	@PostMapping("/replyModify")
	public ResponseEntity<Object> replyModify(Contact_replyDTO replyDTO, HttpServletRequest request) throws Exception{
		
		contactService.modifyReply(replyDTO);
		String jsScript = "<script>";
				jsScript += " alert('댓글을 수정하였습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/contact/contactDetail?boardId=" + replyDTO.getBoardId() + "';";	
				jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/replyRemove")
	public ModelAndView replyDelete(@RequestParam("replyId") long replyId) throws Exception{
		ModelAndView mv = new ModelAndView("/contact/replyRemove");
		mv.addObject("replyDTO", contactService.getReplyDetail(replyId));
		
		return mv;
	}
	
	@PostMapping("/replyRemove")
	public ResponseEntity<Object> replyDelete(Contact_replyDTO replyDTO, HttpServletRequest request) throws Exception{
		
		contactService.removeReply(replyDTO);
		String jsScript = "<script>";
				jsScript += " alert('댓글을 삭제하였습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/contact/contactDetail?boardId=" + replyDTO.getBoardId() + "';";	
				jsScript += "</script>";
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
}
