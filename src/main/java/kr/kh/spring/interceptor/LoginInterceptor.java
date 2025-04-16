package kr.kh.spring.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MemberService memberService;
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView mv)
	    throws Exception {
		
		//넘겨준 회원 정보를 가져옴
		MemberVO user = (MemberVO)mv.getModel().get("user");
		HttpSession session = request.getSession();
		if(user == null) {
			return;
		}
		session.setAttribute("user", user);
		//자동 로그인이 체크되어 있지않으면 종료
		if(!user.isAuto()) {
			return;
		}
		//체크되어 있으면 쿠키를 생성해서 클라이언트에게 전송
		Cookie cookie = new Cookie("LC", session.getId());
		cookie.setPath("/");
		int time = 60 * 60 * 24 * 7; //단위: 초 => 7일로 환산
		cookie.setMaxAge(time);
		//response 객체에 쿠키를 담아서 전송 => 클라이언트에 쿠키가 전송
		response.addCookie(cookie);
		//db에 자동 로그인 정보를 저장
		user.setMe_cookie(session.getId());
		//System.currentTimeMillis() : 현재 시간을 밀리초로 반환
		Date date = new Date(System.currentTimeMillis() + time * 1000);
		user.setMe_limit(date);
		memberService.updateCookie(user);
	}
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
			
			return true;
	}
}