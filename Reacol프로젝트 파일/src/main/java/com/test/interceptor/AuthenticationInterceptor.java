package com.test.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("loginProcess");
		
		if( obj == null) {
			response.sendRedirect("loginProcess");
			return false;
		}
		
		return true;
	}
	
	 @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        // TODO Auto-generated method stub
	        super.postHandle(request, response, handler, modelAndView);
	    }
	 
}
