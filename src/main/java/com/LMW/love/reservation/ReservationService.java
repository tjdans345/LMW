package com.LMW.love.reservation;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;
	
	public List reslist(HashMap<String,Object> map,String nameSerch) {
		map.put("nameSerch","%"+nameSerch+"%");
		return reservationDAO.reslist(map);
	}
	public List getPoint() {
		return reservationDAO.getPoint();
	}
	public ReservationVO resinfo(int num) {
		return reservationDAO.resinfo(num);
	}
	public void resModPro(ReservationVO reservationVO) {
		reservationDAO.resModPro(reservationVO);
	}
	public void adminMemoSave(String adminMemo,int num) {
		HashMap map =new HashMap();
		map.put("adminMemo",adminMemo);
		map.put("num",num);
		reservationDAO.adminMemoSave(map);
	}
	public void stateChage(int num) {
		reservationDAO.stateChage(num);
	}
	public int restotal(String pointName, String nameSerch,int statecheck) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("nameSerch","%"+nameSerch+"%");
		map.put("pointName",pointName);
		map.put("statecheck",statecheck);
		return reservationDAO.restotal(map);
	}
}
