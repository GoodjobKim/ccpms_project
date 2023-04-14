package com.application.ccpms.myPage.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.member.service.MemberService;
import com.application.ccpms.myPage.dto.CartDTO;
import com.application.ccpms.myPage.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/myInfo")
	public ModelAndView main(@RequestParam("memberId") String memberId) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myInfo");
		mv.addObject("memberDTO", myPageService.getMyInfo(memberId));
		return mv;
	}
	
	@PostMapping("/modifyInfo")
	public ResponseEntity<Object> modifyInfo(MemberDTO memberDTO, HttpServletRequest request) throws Exception{
		myPageService.modifyInfo(memberDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('정보가 수정되었습니다.');";
				jsScript += "location.href='" + request.getContextPath() + "/myPage/myInfo?memberId=" +memberDTO.getMemberId()+ "';";
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/removeMember")
	public ResponseEntity<Object> removeMamer(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		myPageService.removeMember(request.getParameter("memberId"));
		
		String jsScript = "<script>";
				jsScript += " alert('회원탈퇴 되었습니다.');";
				jsScript += "location.href='" + request.getContextPath() + "/';";
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	@GetMapping("/myOrderList")
	public ModelAndView myOrderList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("/myPage/myOrderList");
		mv.addObject("myOrderList", myPageService.getMyOrderList((String)session.getAttribute("memberId")));
		
		return mv;
	}
	
	@GetMapping("/myOrderRemove")
	public ResponseEntity<Object> myOrderDelete(@RequestParam("orderCheck") long orderCheck) throws Exception{
		
		myPageService.removeOrder(orderCheck);
		
		String jsScript = "<script>";
				jsScript += " alert('주문을 취소하였습니다.');";
				jsScript += " location.href='myOrderList';";	
				jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/myCartList")
	public ModelAndView myCartList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("/myPage/myCartList");
		
		String memberId = (String)session.getAttribute("memberId");
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
	
	@GetMapping("/addcart")
	public @ResponseBody String addCart(@RequestParam("goodsCd") int goodsCd , @RequestParam("cartGoodsQty") int cartGoodsQty , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("memberId");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setMemberId(memberId);
		cartDTO.setGoodsCd(goodsCd);
		cartDTO.setCartGoodsQty(cartGoodsQty);
		
		String result = "Duple";
		if(!myPageService.checkDupleCart(cartDTO)) {
			myPageService.addCart(cartDTO);
			//session.setAttribute("myCartCnt", memberService.getMyInfo(memberId));
			result = "notDuple";
		}
		
		return result;
	}
	
	@GetMapping("/removeCart")
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList , HttpServletRequest request) throws Exception{
		
		String[] temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myPageService.removeCart(deleteCartCdList);
		
		HttpSession session = request.getSession();
		//session.setAttribute("myCartCnt", memberService.getMyInfo(memberId));
		
		String jsScript = "<script>";
				jsScript += " alert('삭제 하였습니다.');";
				jsScript += " location.href='myCartList';";	
				jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
}
