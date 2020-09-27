package com.LMW.love.reservation;

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
}
