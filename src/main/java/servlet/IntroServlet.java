package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet({"/intro"})
public class IntroServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	static final Logger log = LoggerFactory.getLogger(IntroServlet.class);
	//private Service service = new Service();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("get [FULL URL] " + fullURL);

		RequestDispatcher rd = request.getRequestDispatcher("");
		String pageName = "intro.jsp";

		rd.forward(request, response);
		log.trace("forward: " + pageName);
	}
}
