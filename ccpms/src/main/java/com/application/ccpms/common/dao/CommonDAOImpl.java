package com.application.ccpms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.goods.dto.GoodsDTO;

@Repository
public class CommonDAOImpl implements CommonDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListGoodsBestConsert() throws Exception {
		return sqlSession.selectList("common.selectListGoodsBestConsert");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsNewConsert() throws Exception {
		return sqlSession.selectList("common.selectListGoodsNewConsert");
	}

	@Override
	public List<Map<String, Object>> selectListMusicalRanking() throws Exception {
		return sqlSession.selectList("common.selectListMusicalRanking");
	}

	@Override
	public List<Map<String, Object>> selectListTheaterRanking() throws Exception {
		return sqlSession.selectList("common.selectListTheaterRanking");
	}

}
