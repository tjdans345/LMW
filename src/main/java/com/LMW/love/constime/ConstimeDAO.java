package com.LMW.love.constime;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConstimeDAO {
	
	@Autowired
	private SqlSession sqlSession;
}
