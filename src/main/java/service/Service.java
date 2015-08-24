package service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import manager.ParameterManager;
import manager.UserManager;
import vo.ParameterVO;
import vo.UserVO;

public class Service {
	static final Logger log = LoggerFactory.getLogger(Service.class);
	private UserManager userManager;
	private ParameterManager paramManager;

	public Service() {
		userManager = new UserManager();
		paramManager = new ParameterManager();
	}

	// 키 생성 로직 포
	public UserVO userRegiter(Object object) {
		UserVO user = (UserVO) object;
		log.trace("method:userRegister #"+user.toString());

		userManager.register(user);
		UserVO result = (UserVO) userManager.searchUser(user);
		result.setParamList(new ArrayList<ParameterVO>());
		
		return result;
	}

	public UserVO passwdCheck(UserVO user) {
		log.trace("method:passwdCheck #" + user.toString());
		UserVO result = (UserVO) userManager.searchUser(user);
		
		if(result != null){
			log.trace("password check: true");
			ParameterManager paramManager = new ParameterManager();
			result.setParamList(paramManager.getUserParameterList(result));
			log.debug("set parameter list: "+result.getParamList().size());
			return result;
		}
		
		log.trace("password check: false");
		return null;
	}
	
	/*
	 * 추가한 파라메터가 포함 된 유저 객체 리턴 
	 */
	public UserVO addParameter(Object object, String param){
		log.trace("method:addParameter #"+object.toString()+", "+param);
		
		int status = paramManager.addParameter(object, param);
		log.debug("add parameter status :"+status);
		
		UserVO user = (UserVO) object;
		
		if(status == 1){
			user.setParamList(paramManager.getUserParameterList(user));
			log.debug("set new user parameters");
		}
		
		return user;
	}

	public UserVO removeParameter(Object object, String param) {
		log.trace("method:removeParameter #"+ object.toString()+", "+param);
		int status = paramManager.removeParameter(object, param);
		log.debug("remove parameter status :"+status);
		
		UserVO user = (UserVO) object;
		
		if(status == 1){
			user.setParamList(paramManager.getUserParameterList(user));
			log.debug("set new user parameters");
		}
		
		return user;
	}
	
	public UserVO setNumberOfParameters(UserVO user){
		UserVO result = user;
		
		for(int i=0; i<user.getParamList().size(); i++){
			result.getParamList().get(i).setNumberOfRecord(
					paramManager.getNumberOfParameter(user.getParamList().get(i).getParameter()) - 1);
		}
		
		return result;
	}

}
