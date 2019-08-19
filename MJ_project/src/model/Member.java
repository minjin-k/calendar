package model;

public class Member {
	private String id;
	private String major;
	private String pass;
	private String repass;
	private String name;
	private String nick;
	private String tel;
	private String picture;
	private int accept;
	
	//getter,setter, toString
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRepass() {
		return repass;
	}
	public void setRepass(String repass) {
		this.repass = repass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int i) {
		this.accept = i;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", major=" + major + ", pass=" + pass + ", repass=" + repass + ", name=" + name
				+ ", nick=" + nick + ", tel=" + tel + ", picture=" + picture + ", accept=" + accept + "]";
	}
	
	
}
	
	
	
