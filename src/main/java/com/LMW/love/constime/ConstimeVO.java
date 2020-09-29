package com.LMW.love.constime;


import org.springframework.stereotype.Component;

@Component
public class ConstimeVO {
	private String time,timeName;
	private int state;
	
	

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTimeName() {
		return timeName;
	}

	public void setTimeName(String timeName) {
		this.timeName = timeName;
	}
	
}
