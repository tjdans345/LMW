package com.LMW.love.constime;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		mav.addObject("timelist",constimeService.timelist());
		mav.setViewName("constime");
		return mav;
	}
	@RequestMapping(value = "/com", method = RequestMethod.GET)
	public ModelAndView com() {
		mav.setViewName("com");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value = "/timestate", method = RequestMethod.POST)
	public void timestate(@RequestParam int state , @RequestParam String time){
		if(state==1) {
			state=0;
		}else {
			state=1;
		}
		constimeService.timestate(state, time);
	}
}
