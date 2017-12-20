package movie.common.loginCheck;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try{
			if(request.getSession().getAttribute("session_member_grade") == "0" || request.getSession().getAttribute("session_member_grade") == null)
			{
				response.sendRedirect("/movie/main.see");
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
}
