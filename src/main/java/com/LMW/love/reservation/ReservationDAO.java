package com.LMW.love.reservation;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List reslist(HashMap<String,Object> map){
		 return sqlSession.selectList("mapper.Reservation.reslist",map);
	}
	public List getPoint() {
		return sqlSession.selectList("mapper.Point.getPoint");
	}
	public ReservationVO resinfo(int num) {
		return sqlSession.selectOne("mapper.Reservation.resinfo",num);
	}
	public void resModPro (ReservationVO reservationVO) {
		sqlSession.update("mapper.Reservation.resModPro",reservationVO);
	}
	public void adminMemoSave(HashMap map) {
		sqlSession.update("mapper.Reservation.adminMemoSave",map);
	}
	public void stateChage(int num) {
		sqlSession.update("mapper.Reservation.stateChage",num);
	}
	public int restotal() {
		return sqlSession.selectOne("mapper.Reservation.restotal");
	}
	public List sizechange(int pagesize) {
		return sqlSession.selectList("mapper.Reservation.sizechange",pagesize);
	}
}
