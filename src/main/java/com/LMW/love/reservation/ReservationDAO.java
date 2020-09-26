package com.LMW.love.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List reslist(int pagefirst){
		 return sqlSession.selectList("mapper.Reservation.reslist",pagefirst);
	}
	public List getPoint() {
		return sqlSession.selectList("mapper.Point.getPoint");
	}
	public ReservationVO resinfo(int num) {
		return sqlSession.selectOne("mapper.Reservation.resinfo",num);
	}
}
