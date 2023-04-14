package com.application.ccpms.member.controller;

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

import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/register")
	public ModelAndView register() throws Exception{
		return new ModelAndView("/member/register");
	}
	
	@PostMapping("/register")
	public ResponseEntity<Object> register(MemberDTO memberDTO, HttpServletRequest request) throws Exception{
		memberService.addMember(memberDTO);
		
		String message = "<script>";
				message += "alert('가입이 완료되었습니다.');";
				message += " location.href=' "+ request.getContextPath() + "/';";
				message += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@GetMapping("/checkDuplicatedId")
	public ResponseEntity<String> checkDuplicatedId(@RequestParam("memberId") String memberId)throws Exception{
		return new ResponseEntity<String>(memberService.checkDuplicated(memberId), HttpStatus.OK);
	}
	
	@GetMapping("/login")
	public ModelAndView login() throws Exception{
		return new ModelAndView("/member/login");
	}
	
	@PostMapping("/login")
	public ResponseEntity<Object> login(MemberDTO memberDTO, HttpServletRequest request) throws Exception{
		String message = "";
		if(memberService.login(memberDTO)) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDTO.getMemberId());
			session.setAttribute("role", "client");
			session.setAttribute("myOrderCnt", memberService.getMyOrderCnt(memberDTO.getMemberId()));
			session.setMaxInactiveInterval(60 * 30);
			
			message = "<script>";
			message += "alert('로그인되었습니다.');";
			message += " location.href=' "+ request.getContextPath() + "/';";
			message += "</script>";
		}
		else {
			message = "<script>";
			message += "alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.');";
			message += "history.go(-1);";
			message += "</script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logout(HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		String message = "<script>";
				message += "alert('로그아웃 되었습니다.');";
				message += " location.href=' "+ request.getContextPath() + "/';";
				message += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);

		
	}
}
