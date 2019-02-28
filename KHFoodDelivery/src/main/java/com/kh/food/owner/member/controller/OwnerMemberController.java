package com.kh.food.owner.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.food.owner.member.model.service.OwnerMemberService;
import com.kh.food.owner.member.model.vo.Owner;

@Controller
public class OwnerMemberController {
	
	@Autowired
	OwnerMemberService service;
	
	private Logger logger = LoggerFactory.getLogger(OwnerMemberController.class);
	
	@RequestMapping("/owner/ownerEnrollEnd.do")
	public ModelAndView InsertOwner(Owner o)
	{
		
		logger.debug("Owner"+o);
		String msg = "";
		String loc = "/";

		ModelAndView mv = new ModelAndView();
		int result = service.insertOwner(o);
		if(result >0)
		{
			msg="회원가입 성공";
		}
		else
		{
			msg="회원가입 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/owner/ownerSearchPw.do")
	public String ownerSearchPw()
	{
		return "owner/ownerPwSearch";
	}
	
}