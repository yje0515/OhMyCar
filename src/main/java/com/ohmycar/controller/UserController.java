package com.ohmycar.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohmycar.domain.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@RequiredArgsConstructor
@Log4j
public class UserController {
	// 회원가입 로그인 sns간편로그인 간편회원가입 현대api 스프링이메일인증번호 api Spring Security csrf토큰
	// 비밀번호찾기

	@GetMapping("/test")
	public void doTest() {
		log.info("test......");
	}

	// 회원가입
	@GetMapping("/join")
	public void joinGet() {
		log.info("join.......");
	}

	@PostMapping("/join")
	public String joinPost(UserVO vo, RedirectAttributes rttr) {
		// DB에 UserVO(회원정보객체) 넣기
		return "redirect:/user/login";
	}


	@GetMapping("/main")
	public void mainGet() {
		log.info("main....");
	}

	// 회원 접근 가능
	@GetMapping("/mypage")
	public void mypageGet() {
		log.info("mypage....");

	}

	// 관리자 접근 가능
	@GetMapping("/admin")
	public void adminGet() {
		log.info("admin....");

	}

}
