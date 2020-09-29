package com.LMW.love.reservation;

import java.util.HashMap;
import java.util.List;

import javax.net.ssl.SSLEngineResult.Status;
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

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/rescheck", method = RequestMethod.GET)
	public ModelAndView rescheck(HttpServletRequest request) {
		int nowpage = 1;
			if(request.getParameter("nowpage")!=null) {
				nowpage = Integer.parseInt(request.getParameter("nowpage"));
			}
		int pagesize = 3;
			if(request.getParameter("pagesize")!=null) pagesize=Integer.parseInt(request.getParameter("pagesize"));
		String pointName = "%%";
		if(request.getParameter("pointName")!=null) pointName = request.getParameter("pointName");
		String nameSerch = "%%";
		if(request.getParameter("nameSerch")!=null) nameSerch = request.getParameter("nameSerch");
		int statecheck = 0;
		if(request.getParameter("statecheck")!=null) statecheck = Integer.parseInt(request.getParameter("statecheck"));
		int total = reservationService.restotal(pointName,nameSerch,statecheck);
		int pagefirst =(nowpage-1)* pagesize;
		int totalpage = total/pagesize +(total%pagesize==0?0:1);
		int blocksize = 3;
		int blockfirst = ((nowpage/blocksize)-(nowpage%blocksize==0?1:0))*blocksize+1;
		int blocklast = blockfirst+ blocksize-1;
			if(blocklast>totalpage) blocklast=totalpage;
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("nameSerch",nameSerch);
		map.put("pointName",pointName);
		map.put("nowpage",nowpage);
		map.put("blockfirst",blockfirst);
		map.put("blocklast",blocklast);
		map.put("totalpage",totalpage);
		map.put("blocksize",blocksize);
		map.put("pagefirst",pagefirst);
		map.put("pagesize",pagesize);
		map.put("statecheck",statecheck);
		mav.addObject("reslist",reservationService.reslist(map,nameSerch));
		mav.addObject("point", reservationService.getPoint());
		map.put("nameSerch",nameSerch);
		mav.addObject("map",map);
		mav.setViewName("rescheck");
		return mav;
	}

	@RequestMapping(value = "/resView", method = RequestMethod.GET)
	public ModelAndView resView(@RequestParam int num) {
		mav.addObject("resinfo",reservationService.resinfo(num));
		mav.setViewName("resView");
		return mav;
	}
	@RequestMapping(value = "/resMod", method = RequestMethod.GET)
	public ModelAndView resMod(@RequestParam int num) {
		mav.addObject("resinfo",reservationService.resinfo(num));
		mav.addObject("getPoint", reservationService.getPoint());
		mav.setViewName("resMod");
		return mav;
	}
	@RequestMapping(value = "/resModPro", method = RequestMethod.POST)
	public ModelAndView resModPro(ReservationVO reservationVO) {
		reservationService.resModPro(reservationVO);
		mav.setViewName("redirect:/resView.res?num="+reservationVO.getNum());
		return mav;
	}
	@RequestMapping(value = "/adminMemoSave" , method = RequestMethod.POST)
	@ResponseBody
	public void adminMemoSave(@RequestParam int num,
							  @RequestParam String adminMemo){
		reservationService.adminMemoSave(adminMemo, num);
	}
	@RequestMapping(value = "/stateChage" , method = RequestMethod.POST)
	@ResponseBody
	public void stateChage(@RequestParam int num){
		reservationService.stateChage(num);
		
	}
	
}
