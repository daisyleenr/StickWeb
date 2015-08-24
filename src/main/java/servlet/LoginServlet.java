package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import service.Service;
import vo.UserVO;

@WebServlet({ "/login" })
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static final Logger log = LoggerFactory.getLogger(LoginServlet.class);
	private Service service = new Service();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("get [FULL URL] " + fullURL);

		HttpSession session = request.getSession();
		String pageName = "login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(pageName);
		
		String logout = request.getParameter("logout");
		if(logout != null && logout.equals("true")){
			session.invalidate();
			log.trace("logout");
			response.sendRedirect("index.jsp");
			log.trace("redirect: index.jsp");
		}else{
			rd.forward(request, response);
			log.trace("forward: " + pageName);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("post [FULL URL] " + fullURL);

		HttpSession session = request.getSession();
		//RequestDispatcher rd = request.getRequestDispatcher("");
		String pageName = "";

		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");

		UserVO user = new UserVO(email, passwd);
		user = service.passwdCheck(user);

		if (user != null) {
			session.setAttribute("user", user);
		} else {
		}

		response.sendRedirect("api_manage.jsp");
		log.trace("redirect: api_manage.jsp");
	}

}
