package com.LMW.love.constime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConstimeController {
	
	@Autowired
	private ConstimeService constimeService;
	
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping(value = "/constime", method = RequestMethod.GET)
	public ModelAndView constime() {
		mav.setViewName("constime");
		return mav;
	}
	@RequestMapping(value = "/com", method = RequestMethod.GET)
	public ModelAndView com() {
		mav.setViewName("com");
		return mav;
	}
}
