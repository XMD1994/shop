package shop.user;

/*
 * 用户实体类对象
 * create table user(
	uid int primary key auto_increment,
	username varchar(20) ,
	password varchar(20) ,
	name varchar(20),
	email varchar(30),
	phone varchar(20),
	addr varchar(50),
	sex varchar(10),
	state int,
	code varchar(64)
);

 * */
public class User {
	private Integer uid;//用户id
	private String username;//用户名
	private String password;//密码
	private String name;//姓名
	private String email;//邮箱
	private String phone;//电话号码
	private String addr;//地址
	private String sex;//性别
	private Integer state;//状态
	private String code;//激活码
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
