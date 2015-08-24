package vo;

import java.util.Date;

public class ParameterVO {
	private int id;
	private String title;
	private String parameter;
	private int user_id;
	private int numberOfRecord;
	private Date created_at;

	public ParameterVO() {

	}

	public ParameterVO(int id, String title, String parameter, int user_id, int numberOfRecord, Date created_at) {
		this.id = id;
		this.title = title;
		this.parameter = parameter;
		this.user_id = user_id;
		this.numberOfRecord = numberOfRecord;
		this.created_at = created_at;
	}

	public ParameterVO(String title, String parameter, int user_id) {
		this.title = title;
		this.parameter = parameter;
		this.user_id = user_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public int getNumberOfRecord() {
		return numberOfRecord;
	}

	public void setNumberOfRecord(int numberOfRecord) {
		this.numberOfRecord = numberOfRecord;
	}

	@Override
	public String toString() {
		return super.toString();
	}
}
