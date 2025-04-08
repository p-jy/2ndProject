package kr.kh.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.spring.model.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
		//컨트롤러가 보내준 회원 정보를 가져옴
		MemberVO user = (MemberVO)modelAndView.getModel().get("user");
		
		HttpSession session = request.getSession();
		if(user == null) {
			return;
		}
		session.setAttribute("user", user);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
			
			//구현
			return true;
	}
}
