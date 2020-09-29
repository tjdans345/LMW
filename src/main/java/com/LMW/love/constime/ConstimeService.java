package com.LMW.love.constime;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConstimeService {

	@Autowired
	private ConstimeDAO constimeDAO;
	
	public List timelist() {
		return constimeDAO.timelist();
	}
	public void timestate(int state , String time) {
		HashMap map = new HashMap();
		map.put("state",state);
		map.put("time",time);
		constimeDAO.timestate(map);
	}
}
