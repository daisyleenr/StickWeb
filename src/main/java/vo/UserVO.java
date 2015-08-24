package vo;

import java.util.ArrayList;
import java.util.Date;

public class UserVO {
	private int id;
	private String email;
	private String passwd;
	private String user_name;
	private String title;
	//private String api_key;
	private Date created_at;
	
	private ArrayList<ParameterVO> paramList;
	
	public UserVO() {
		
	}
	
	public UserVO(int id, String email, String passwd, String user_name, String title, Date created_at) {
		super();
		this.id = id;
		this.email = email;
		this.passwd = passwd;
		this.user_name = user_name;
		this.title = title;
		this.created_at = created_at;
		
		setParamList(new ArrayList<ParameterVO>());
	}
	
	public UserVO(String email, String passwd, String user_name, String title) {
		super();
		this.email = email;
		this.passwd = passwd;
		this.user_name = user_name;
		this.title = title;
	}

	public UserVO(String email, String passwd) {
		super();
		this.email = email;
		this.passwd = passwd;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return super.toString();
	}

	public ArrayList<ParameterVO> getParamList() {
		return paramList;
	}

	public void setParamList(ArrayList<ParameterVO> paramList) {
		this.paramList = paramList;
	}
}



