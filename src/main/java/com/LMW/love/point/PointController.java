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
<<<<<<< HEAD
	//지점관리 메인페이지 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public ModelAndView point(HttpServletRequest request) {
		//모든 지점 리스트 전달
=======
	
	//吏��젏愿�由� 硫붿씤�럹�씠吏� �씠�룞
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public ModelAndView point(HttpServletRequest request) {
		
		
		//紐⑤뱺 吏��젏 由ъ뒪�듃 �쟾�떖
>>>>>>> f6a3b1019a5bd9031b8e3b6951b23e4a058e1a02
		mav.addObject("pointList", pointService.allList());
		mav.setViewName("point");
		return mav;
	}
<<<<<<< HEAD
	//출력 상태 변경 메소드
=======
	
	//異쒕젰 �긽�깭 蹂�寃� 硫붿냼�뱶
>>>>>>> f6a3b1019a5bd9031b8e3b6951b23e4a058e1a02
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
