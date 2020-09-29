package com.LMW.love.point;

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
	
	//吏��젏愿�由� 硫붿씤�럹�씠吏� �씠�룞
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public ModelAndView point(HttpServletRequest request) {
		
		
		//紐⑤뱺 吏��젏 由ъ뒪�듃 �쟾�떖
		mav.addObject("pointList", pointService.allList());
		mav.setViewName("point");
		return mav;
	}
	
	//異쒕젰 �긽�깭 蹂�寃� 硫붿냼�뱶
	@RequestMapping(value = "/yes", method = RequestMethod.POST)
	@ResponseBody
	public void changeState(@RequestParam String state, int num, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.getWriter().println(pointService.changeState(num, state)); 
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
