package com.LMW.love.reservation;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component
public class ReservationVO {
	private int num,state ,point;
	private String name,tel;
	private Date VisitDate,RegiDate;
	private Time ConsTime;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getVisitDate() {
		return VisitDate;
	}
	public void setVisitDate(Date visitDate) {
		VisitDate = visitDate;
	}
	public Date getRegiDate() {
		return RegiDate;
	}
	public void setRegiDate(Date regiDate) {
		RegiDate = regiDate;
	}
	public Time getConsTime() {
		return ConsTime;
	}
	public void setConsTime(Time consTime) {
		ConsTime = consTime;
	}
	
	

}
