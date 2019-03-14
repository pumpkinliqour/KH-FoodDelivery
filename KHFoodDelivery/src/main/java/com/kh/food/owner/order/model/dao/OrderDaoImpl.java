package com.kh.food.owner.order.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.order.model.vo.Pay;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Pay> selectOrderList() {
		return sqlSession.selectList("ownerOrder.selectOrderList");
	}

	@Override
	public List<Map<String,String>> selectPayOrderNum(String payOrderNum) {
		return sqlSession.selectList("ownerOrder.selectPayOrderNum",payOrderNum);
	}
	
	
}
