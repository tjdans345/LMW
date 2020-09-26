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
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		mav.setViewName("home");
		return mav;
	}
	
}
