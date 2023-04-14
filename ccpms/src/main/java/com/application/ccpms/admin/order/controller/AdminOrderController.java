package com.application.ccpms.admin.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccpms.admin.order.service.AdminOrderService;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@GetMapping("/adminOrderList")
	public ModelAndView adminOrderList() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/order/adminOrderList");
		mv.addObject("orderList", adminOrderService.getOrderList());
		
		return mv;
	}
}
