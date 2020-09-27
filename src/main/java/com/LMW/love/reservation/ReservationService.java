package com.LMW.love.reservation;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;
	
	public List reslist(int pagefirst) {
		
		return reservationDAO.reslist(pagefirst);
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
	public int restotal() {
		return reservationDAO.restotal();
	}
}
