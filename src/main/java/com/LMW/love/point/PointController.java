package com.LMW.love.point;

import java.awt.PageAttributes.MediaType;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointController {
	@Autowired
	private PointService pointService;
	private ModelAndView mav = new ModelAndView();

	//지점관리 메인페이지 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public ModelAndView point(HttpServletRequest request) {
		//모든 지점 리스트 전달

		mav.addObject("pointList", pointService.allList());
		mav.setViewName("point");
		return mav;
	}
	//출력 상태 변경 메소드

	@RequestMapping(value = "/yes", method = RequestMethod.POST)
	@ResponseBody
	public void changeState(@RequestParam String state, int num, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.getWriter().println(pointService.changeState(num, state)); 
	}
		//지점관리 메인페이지 이동
		@RequestMapping(value = "/test", method = RequestMethod.POST)
		public ModelAndView test(HttpServletRequest request) {
			String pName = request.getParameter("pointname");
			String msg = pointService.addPoint(pName); 
			//모든 지점 리스트 전달
//			mav.addObject("pointList", pointService.allList());
			mav.setViewName("redirect:/point.poi");
			return mav;
		}
	
		//삭제 메소드
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		@ResponseBody
		public List deletePoint(@RequestParam int num, HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			return pointService.deletePoint(num);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
