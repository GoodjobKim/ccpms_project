package com.application.ccpms.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDAOImpl implements AdminOrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectOrderList() throws Exception {
		return sqlSession.selectList("adminOrder.OrderList");
	}
}
