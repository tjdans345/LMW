package com.LMW.love.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<PointVO> allList() {
		
		return sqlSession.selectList("mapper.Point.allList");
	}
}
