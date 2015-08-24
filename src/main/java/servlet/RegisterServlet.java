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

@WebServlet({"/register"})
public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	

	static final Logger log = LoggerFactory.getLogger(RegisterServlet.class);
	private Service service = new Service();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("get [FULL URL] " + fullURL);

		String pageName = "register.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(pageName);

		rd.forward(request, response);
		log.trace("forward: " + pageName);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("post [FULL URL] " + fullURL);

		HttpSession session = request.getSession();
		String pageName = "";
		UserVO user = new UserVO(request.getParameter("email"), request.getParameter("passwd"),
				request.getParameter("username"), request.getParameter("title"));
		log.trace("created user object: # " + user.toString());

		UserVO currUser  = service.userRegiter(user);

		session.setAttribute("user", currUser);
		log.trace("register complete");
		
		pageName = "api_manage.jsp";
		response.sendRedirect(pageName);
		log.trace("redirect: " + pageName);
	}

}
