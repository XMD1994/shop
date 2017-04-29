package shop.user;

import java.util.List;

import shop.product.Product;
import shop.utils.PageBean;
import shop.utils.UUIDUtils;


/*
 * 用户模块业务层
 * */
public class UserService {
	
	//注入Dao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//业务层注册用户
	public void regist(User user)
	{
		//保存用户
		user.setState(0);//  0未激活    1已经激活
		//生成激活码
		String code = UUIDUtils.getUUID();
		user.setCode(code);
		
		userDao.save(user);
		//发送邮件
	}
	//根据code查用户
	public User findByCode(String code)
	{
		return userDao.findByCode(code);
	}

	public void update(User existUser) {
		userDao.update(existUser);
		
	}

	public User login(User user) {
		
		return userDao.login(user);
	}

	public User findByUserName(String username) {
		return userDao.findByUserName(username);
	}

	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		Integer limit = 10;
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		Integer totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		Integer totalPage = 0;
		if(totalCount % limit ==0)
		{
			totalPage = totalCount / limit;
		}
		else
		{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		Integer begin = (page - 1) * limit;
		List<User> list = userDao.findByPage( begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	public User findById(Integer id) {
		return userDao.findById(id);
	}

	public void delete(User oldUser) {
		userDao.delete(oldUser);
	}
	
	
}
