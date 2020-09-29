package com.LMW.love.point;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//지점 리스트 DB 출력
	public List<PointVO> allList() {
		return sqlSession.selectList("mapper.Point.allList");
	}

	//지점 상태 변경
	public int changeState(int num, String state) {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("state", state);
		return sqlSession.update("mapper.Point.changeState", map);
		
	}
	
	//상태 변경 후 리스트 출력
	public PointVO changeList(int num) {
		return sqlSession.selectOne("mapper.Point.changeList", num);
	}

	public String addPoint(String pName) {
		String msg = "";
		
		int insertresult = sqlSession.insert("mapper.Point.addPoint", pName);
		
		if(insertresult == 1) {
			msg = "등록 완료";
		}else {
			msg = "등록 실패";
		}
		return msg;
	}

	//지점 삭제 메소드
	public int deltePoint(int num) {
		
		return sqlSession.delete("mapper.Point.deletePoint", num);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
