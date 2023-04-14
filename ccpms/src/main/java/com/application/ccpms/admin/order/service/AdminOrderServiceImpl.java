package com.application.ccpms.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccpms.admin.order.dao.AdminOrderDAO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<Map<String, Object>> getOrderList() throws Exception {
		return adminOrderDAO.selectOrderList();
	}
}
