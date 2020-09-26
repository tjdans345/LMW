package com.LMW.love.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

	@Autowired
	private PointDAO pointDAO;

	public List<PointVO> allList() {


		return pointDAO.allList();
		
	}
}
