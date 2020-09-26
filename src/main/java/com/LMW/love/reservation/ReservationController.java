package com.LMW.love.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/rescheck", method = RequestMethod.GET)
	public ModelAndView rescheck() {
		mav.addObject("reslist",reservationService.reslist(0));
		mav.setViewName("rescheck");
		return mav;
	}
	@RequestMapping(value = "/resMod", method = RequestMethod.GET)
	public ModelAndView resMod(@RequestParam int num) {
		mav.addObject("resinfo",reservationService.resinfo(num));
		mav.addObject("getPoint", reservationService.getPoint());
		mav.setViewName("resMod");
		return mav;
	}
	
}
