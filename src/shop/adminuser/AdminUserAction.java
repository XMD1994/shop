package shop.adminuser;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser>{
	private AdminUser adminUser = new AdminUser();
	//注入service
	private AdminUserService adminUserService;
	
	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	@Override
	public AdminUser getModel() {
		return adminUser;
	}

	
	/*
	 * 后台登入的方法
	 * */
	public String login()
	{
		
		AdminUser existAdminUser = adminUserService.login(adminUser);
		if(existAdminUser == null)
		{
			this.addActionError("用户名或密码错误");
			return LOGIN;
		}
		else
		{
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess"; 
		}
		
	}

	
}
