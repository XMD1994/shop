package shop.adminuser;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AdminUserDao extends HibernateDaoSupport {

	public AdminUser login(AdminUser adminUser) {
		AdminUser existAdminUser = null;
		List<AdminUser> list = this.getHibernateTemplate().find("from AdminUser where username=? and password=?",adminUser.getUsername(),adminUser.getPassword());
		if(list.size() != 0)
		{
			existAdminUser = list.get(0);
		}
		return existAdminUser;
	}
	
}
