package shop.user;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import shop.product.Product;
import shop.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * 用户的Action
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{
	// Struts2中模型驱动使用的类
	private User user = new User();
	// 注入userService
	private UserService userService;
	// 接收验证码
	private String checkcode;
	
	//接收页数
	private Integer page;
	
	//分页用户显示
	private PageBean<User> pageBean;
	
	
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public User getModel() {
		return user;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public PageBean<User> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<User> pageBean) {
		this.pageBean = pageBean;
	}

	

	/**
	 *  编写一个挑转到注册页面的方法:
	 * @return
	 */
	public String registPage(){
		
		return "registPageSuccess";
	}
	
	/**
	 * 前台:注册用户的方法:
	 */
	@InputConfig(resultName="registInput")
	public String regist(){
		// 从Session中获得存的验证码
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(checkcode == null || !checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码错误!");
			return "registInput";
		}
		userService.regist(user);
		this.addActionMessage("注册成功!请联系平台人员激活账户!");
		return "registSuccess";
	}
	
	/**
	 * 前台:激活用户的方法:
	 */
	public String active(){
		// 根据激活码查询用户
		User existUser = userService.findByCode(user.getCode());
		if(existUser != null){
			// 根据激活码查询到这个用户.
			existUser.setState(1);
			// 修改用户的状态
			userService.update(existUser);
			// 添加信息:
			this.addActionMessage("激活成功!请去登录!");
			return "activeSuccess";
		}else{
			this.addActionMessage("激活失败!激活码有误!");
			return "activeSuccess";
		}
	}
	
	/**
	 * 前台:跳转到登录页面的方法
	 */
	public String loginPage(){
		return "loginPageSuccess";
	}
	
	/**
	 * 前台:登录功能:
	 */
	@InputConfig(resultName="loginInput")
	public String login(){
		User existUser = userService.login(user);
		if(existUser == null){
			// 登录失败
			this.addActionError("用户名或密码错误或用户未激活!");
			return "loginInput";
		}else{
			System.out.println(existUser.getName());
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			return "loginSuccess";
		}
		
	}
	
	/**
	 * 前台:注册AJAX校验用户名.
	 * @throws IOException 
	 */
	public String checkUserName() throws IOException{
		User existUser = userService.findByUserName(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(existUser == null){
			// 用户名可以使用的
			response.getWriter().print("<font color='green'>用户名可以使用</font>");
		}else{
			// 用户名已经存在
			response.getWriter().print("<font color='red'>用户名已经存在</font>");
		}
		return NONE;
	}
	
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 获得用户的session.
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quitSuccess";
	}
	
	public String adminFindAll() {
		pageBean = userService.findByPage(page);
		return "adminFindAllSuccess";
	}
	
	public String accountActivation() {
		User oldUser = userService.findById(user.getUid());
		if(oldUser != null)
		{
			oldUser.setState(1);
			userService.update(oldUser);
		}
		return "activationSuccess";
	}
	
	public String delete() {
		User oldUser = userService.findById(user.getUid());
		if(oldUser != null)
		{
			userService.delete(oldUser);
		}
		
		return "deleteSuccess";
	}
}