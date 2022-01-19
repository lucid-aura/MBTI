package secure.mbti.a.dto;

import java.io.Serializable;

public class MemberDto implements Serializable {
	private	String id;
	private String pwd;
	private String name;
	private String alias;
	private String email;
	private String mbti;
	private int auth;
	private String salt;
	
	public MemberDto() {

	}

	public MemberDto(String id, String pwd, String name, String alias, String email, String mbti, int auth,
			String salt) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.alias = alias;
		this.email = email;
		this.mbti = mbti;
		this.auth = auth;
		this.salt = salt;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", alias=" + alias + ", email=" + email
				+ ", mbti=" + mbti + ", auth=" + auth + ", salt=" + salt + "]";
	}


	

}
