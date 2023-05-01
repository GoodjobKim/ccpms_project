package com.application.ccpms.admin.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.goods.dto.GoodsDTO;

@Repository
public class AdminGoodsDAOImpl implements AdminGoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGoods(GoodsDTO goodsDTO) throws Exception {
		sqlSession.insert("adminGoods.insertGoods", goodsDTO);
	}

	@Override
	public List<GoodsDTO> selectListGoods() throws Exception {
		return sqlSession.selectList("adminGoods.selectListGoods");
	}

	@Override
	public void deleteGoods(int goodsCd) throws Exception {
		sqlSession.delete("adminGoods.deleteGoods", goodsCd);
	}

	@Override
	public void updateGoods(GoodsDTO goodsDTO) throws Exception {
		sqlSession.update("adminGoods.updateGoods", goodsDTO);
	}

	@Override
	public void updateShowStatus(GoodsDTO goodsDTO) throws Exception {
		sqlSession.update("adminGoods.updateShowStatus", goodsDTO);
	}
}
