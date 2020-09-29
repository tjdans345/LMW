package com.LMW.love.point;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

	@Autowired
	private PointDAO pointDAO;

	//지점 리스트 출력
	public List<PointVO> allList() {
		return pointDAO.allList();
	}
	
	//지점 상태 변경
	public Object changeState(int num, String state) {
		
		PointVO change = null;
		//지점상태 변경 여부 확인 
		int checkResult = pointDAO.changeState(num, state);
		System.out.println("지점상태여부  :" + checkResult);
		
		if(checkResult == 1) {
			change = pointDAO.changeList(num);
		}
			JSONObject jSONObject = new JSONObject();
			int result = change.getState();
			jSONObject.put("state", result);
			
		return jSONObject;
		
	}
}
