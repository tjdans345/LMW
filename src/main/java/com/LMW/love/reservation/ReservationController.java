package com.LMW.love.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService homeService;
	
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/rescheck", method = RequestMethod.GET)
	public ModelAndView rescheck() {
		mav.setViewName("rescheck");
		return mav;
	}
	
}
