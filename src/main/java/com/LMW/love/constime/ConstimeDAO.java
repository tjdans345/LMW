package com.LMW.love.constime;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConstimeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List timelist() {
		return sqlSession.selectList("mapper.Constime.timelist");
	}
	public void timestate(HashMap map) {
		sqlSession.update("mapper.Constime.timestate",map);
	}
}
