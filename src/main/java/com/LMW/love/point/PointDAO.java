package com.LMW.love.point;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	
	@Autowired
	private SqlSession sqlSession;
}
