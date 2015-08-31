package servlet;

import java.io.IOException;

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

@WebServlet("/api_manage")
public class APIManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static final Logger log = LoggerFactory.getLogger(APIManageServlet.class);
	private Service service = new Service();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("get [FULL URL] " + fullURL);
		
		HttpSession session = request.getSession();
		UserVO currUser = (UserVO) session.getAttribute("user");
		if(currUser == null){
			String pageName = "index.jsp";
			response.sendRedirect(pageName);
			log.trace("redirect: " + pageName);
		}
		else{
			service.setNumberOfParameters(currUser);

			String pageName = "api_manage.jsp";
			response.sendRedirect(pageName);
			log.trace("redirect: " + pageName);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("[FULL URL] " + fullURL);
		
		String pageName = "intro.jsp";
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		
		HttpSession session = request.getSession();
		UserVO currUser = (UserVO) session.getAttribute("user");

		switch (cmd) {
		case "param_add": {
			log.debug("case param_add********");
			String param = request.getParameter("param");
			currUser = service.addParameter(currUser, param);
			session.setAttribute("user", currUser);

			pageName = "api_manage.jsp";
			break;
		}

		case "param_remove": {
			log.debug("case param_remove********");
			String param = request.getParameter("param");
			currUser = service.removeParameter(currUser, param);
			session.setAttribute("user", currUser);

			pageName = "api_manage.jsp";
			break;
		}
		}

		response.sendRedirect(pageName);
		log.trace("redirect: " + pageName);
	}

}
