package com.LMW.love.reservation;



import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;
@Component
public class ReservationVO {
	private int num,state;
	private String name,tel,point,consTime,memo,adminMemo;
	private Timestamp regiDate,ModDate;
	private Date visitDate;
	
	
	public String getAdminMemo() {
		return adminMemo;
	}
	public void setAdminMemo(String adminMemo) {
		this.adminMemo = adminMemo;
	}
	public Timestamp getModDate() {
		return ModDate;
	}
	public void setModDate(Timestamp modDate) {
		ModDate = modDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
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
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
	public String getConsTime() {
		return consTime;
	}
	public void setConsTime(String consTime) {
		this.consTime = consTime;
	}


}
