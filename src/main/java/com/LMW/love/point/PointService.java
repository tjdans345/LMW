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
<<<<<<< HEAD
		System.out.println("지점상태여부  :" + checkResult);
=======
		
>>>>>>> f6a3b1019a5bd9031b8e3b6951b23e4a058e1a02
		if(checkResult == 1) {
			change = pointDAO.changeList(num);
		}
			JSONObject jSONObject = new JSONObject();
			int result = change.getState();
			jSONObject.put("state", result);
		return jSONObject;
	}
	
	//지점 추가
	public String addPoint(String pName) {
		return pointDAO.addPoint(pName);
	}
	
	//지점 삭제
	public List deletePoint(int num) {
		int result = pointDAO.deltePoint(num);
		List allList = null;
		
		//삭제 성공시 전체리스트 조회
		if(result == 1) {
			allList = pointDAO.allList();
		}
		JSONArray jSONArray = new JSONArray();
		for(int i=0; i<allList.size(); i++) {
			PointVO pointVO = (PointVO)allList.get(i);
			JSONObject jSONObject = new JSONObject();
			jSONObject.put("num", pointVO.getNum());
			jSONObject.put("pointname", pointVO.getPointName());
			System.out.println(pointVO.getPointName());
			jSONObject.put("state", pointVO.getState());
			jSONArray.add(jSONObject);
		}
		return jSONArray;
	}
}
