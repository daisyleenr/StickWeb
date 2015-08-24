package manager;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.ParameterDAO;
import vo.ParameterVO;
import vo.UserVO;

public class ParameterManager {

	static final Logger log = LoggerFactory.getLogger(ParameterManager.class);
	ParameterDAO paramDAO;
	
	public ParameterManager() {
		paramDAO = new ParameterDAO();
	}
	
	public ArrayList<ParameterVO> getUserParameterList(Object object) {
		log.trace("mathod:getUserParameterList #"+object.toString());
		ArrayList<ParameterVO> paramList = paramDAO.selectParameters(object);
		return paramList;
	}

	public int addParameter(Object object, String param) {
		log.trace("method:addParameter #"+object.toString());
		int status = 0;
		UserVO user = (UserVO) object;
		
		String parameter = createKey(user.getId() + param + System.currentTimeMillis());
		log.info("created parameter_key: " + parameter);
		
		ParameterVO paramObject = new ParameterVO(param, parameter, user.getId());
		
		status = paramDAO.createRedisSortedSet(paramObject);
		log.debug("create parameter complete. status: " + status);
		
		if(status == 1){
			paramDAO.insert(paramObject);
		}
		
		return status;
	}

	public int removeParameter(Object object, String param) {
		log.trace("method:removeParameter #"+object.toString());
		int status = 0;
		UserVO user = (UserVO) object;
		ParameterVO parameter = null;

		for(ParameterVO p : user.getParamList()){
			if(p.getParameter().equals(param)){
				parameter = p;
				break;
			}
		}
		
		status = paramDAO.removeRedisSortedSet(parameter);
		log.debug("remove parameter complete. status: " + status);
		
		if(status == 1){
			paramDAO.delete(parameter);
		}
		
		return status;
	}

	public int getNumberOfParameter(String parameter) {
		log.trace("method:getNumberOfParameter #"+parameter);
		int number = 0;
		number = paramDAO.zcardParameter(parameter);
		return number;
	}
	


	public String createKey(String str) {
		log.trace("method:createKey #"+str);
		String MD5 = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			MD5 = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			log.error("failed to create api key");
			System.out.println(e);
			MD5 = null;
		}
		// log.info("create key: "+MD5);
		return MD5;
	}

}
