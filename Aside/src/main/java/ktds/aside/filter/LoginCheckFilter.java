package ktds.aside.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {}

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest request2 = (HttpServletRequest)request;
    HttpServletResponse response2 = (HttpServletResponse)response;
    
    HttpSession session = request2.getSession();
    if (session.getAttribute("loginInfo") == null 
        && (request2.getServletPath().startsWith("/diary")
            || request2.getServletPath().startsWith("/user/set_password"))) {
      response2.sendRedirect(
          request.getServletContext().getContextPath() + "/");
    } else {
      chain.doFilter(request, response);
    }
    
  }

  @Override
  public void destroy() {}

}
