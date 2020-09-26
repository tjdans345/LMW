package com.LMW.love.point;

import org.springframework.stereotype.Component;
@Component
public class PointVO {
	private int num,state;
	private String PointName;
	
	
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
	public String getPointName() {
		return PointName;
	}
	public void setPointName(String pointName) {
		PointName = pointName;
	}

}
