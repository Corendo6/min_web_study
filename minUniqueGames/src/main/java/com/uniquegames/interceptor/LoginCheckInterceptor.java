package com.uniquegames.interceptor;

import com.uniquegames.model.SessionConstants;
import com.uniquegames.vo.MemberVo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        String contextPath = request.getContextPath();
//        requestURI.replaceFirst(contextPath+"/",""));

//        log.info("redirectURL={}", request.getRequestURL());
        if(session == null || session.getAttribute(SessionConstants.LOGIN_MEMBER) == null){
            response.sendRedirect("/uniquegames/login2.do?redirectURL="+requestURI.replaceFirst("/uniquegames/",""));
            //기존 요청을 쿼리 파라미터로 redirectURL로 지정함으로써 로그인한 이후에는 기존 요청 페이지로 리다이렉트 될 수 있도록 처리하는 것이 고객 입장에서 편리

            return false; //요청처리 종료
        }
        else if(requestURI.equals(""))
            return true;
        return true;    // 다음 핸들러나 인터셉터로 진행
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

//        if (log.isDebugEnabled()) {
//            log.debug("===================        END        ===================\n");}
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
            Object handler, Exception ex) throws Exception {

    }
}
