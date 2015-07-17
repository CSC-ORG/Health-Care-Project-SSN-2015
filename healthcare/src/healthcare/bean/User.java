package healthcare.bean;

public class User {
	public String name,email,password,id;
	public User(){
	}
	public User(String id, String name, String email) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.email = email;
		this.id = id;
	}
	public User(String id, String name, String email, String password) {
		// TODO Auto-generated constructor stub
		this.id=id;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
