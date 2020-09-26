package com.LMW.love.constime;

import java.sql.Time;

import org.springframework.stereotype.Component;
@Component
public class ConstimeVO {
	private int state,ReserNum;
	private String PointName;
	private Time time;
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getReserNum() {
		return ReserNum;
	}
	public void setReserNum(int reserNum) {
		ReserNum = reserNum;
	}
	public String getPointName() {
		return PointName;
	}
	public void setPointName(String pointName) {
		PointName = pointName;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}

	
	

}
