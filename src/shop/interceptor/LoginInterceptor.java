package shop.interceptor;

import org.apache.struts2.ServletActionContext;

import shop.adminuser.AdminUser;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		AdminUser adminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(adminUser != null)
		{
			
			return actionInvocation.invoke();
		}
		else
		{
			ActionSupport action = (ActionSupport) actionInvocation.getAction();
			action.addActionError("����û�е��룡");
			return action.LOGIN;
		}
		
		
	}

}
