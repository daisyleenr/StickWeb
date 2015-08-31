package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manager.MysqlToRedis;

@WebServlet({ "/upload" })
public class DBUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final Logger log = LoggerFactory.getLogger(DBUploadServlet.class);

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// int maxPostSize = 10 * 1024 * 1024; // 10MB
		// String saveDirectory = getServletContext().getRealPath("/upload");

		// filePart.write(fileName);
		// response.sendRedirect("index.jsp");
		
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("post [FULL URL] " + fullURL);
		String pageName = "api_manage.jsp";
		response.sendRedirect(pageName);
		log.trace("redirect: " + pageName);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullURL = request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?"
				+ request.getQueryString();
		log.trace("post [FULL URL] " + fullURL);
		request.setCharacterEncoding("UTF-8");

		// 10Mbyte 제한
		int maxSize = 1024 * 1024 * 10;
		// 웹서버 컨테이너 경로
		// String root =
		// request.getSession().getServletContext().getRealPath("/");
		// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
		// String savePath = root + "upload";
		// 업로드 파일명

		String savePath = "/home/gangnamchild/stick/upload/";
		//String savePath = "/Users/daisy/Documents/uploadtest/";
		String uploadFile = "";
		// 실제 저장할 파일명
		String newFileName = "";

		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");

		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			String currParam = multi.getParameter("currParam");

			// 전송받은 parameter의 한글깨짐 방지
			// String title = multi.getParameter("title");
			// title = new String(title.getBytes("8859_1"), "UTF-8");

			// 파일업로드
			uploadFile = multi.getFilesystemName("uploadFile");

			// 실제 저장할 파일명(ex : username_20140819151221.sql)
			newFileName = currParam + "_" + simDf.format(new Date(currentTime)) + "."
					+ uploadFile.substring(uploadFile.lastIndexOf(".") + 1);

			// 업로드된 파일 객체 생성
			File oldFile = new File(savePath + uploadFile);
			log.trace("upload file name: " + uploadFile);
			// 실제 저장될 파일 객체 생성
			String filename = savePath + newFileName;
			File newFile = new File(filename);
			log.trace("save file path & name: " + filename);

			// 파일명 rename
			if (!oldFile.renameTo(newFile)) {
				// rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
				buf = new byte[1024];
				fin = new FileInputStream(oldFile);
				fout = new FileOutputStream(newFile);
				read = 0;
				while ((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}

				fin.close();
				fout.close();
				oldFile.delete();
			}

			log.trace("save file");
			
			@SuppressWarnings("unused")
			MysqlToRedis myTest = new MysqlToRedis(filename, currParam);
			
			log.trace("convert redis complete");
			newFile.delete();
			log.trace("delete file");
			String pageName = "api_manage.jsp";
			response.sendRedirect(pageName);
			log.trace("redirect: " + pageName);
		} catch (Exception e) {
			log.error("multipart exception" + e);
		}
	}
}
