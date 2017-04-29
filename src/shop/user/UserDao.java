package shop.user;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.product.Product;
import shop.utils.PageHibernateCallback;

/*
 * 用户Dao
 * 
 * */
public class UserDao extends HibernateDaoSupport {

	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}
	
	//根据code查用户
	public User findByCode(String code)
	{
		List<User> list = this.getHibernateTemplate().find("from User where code=?",code);
		if(list.size() !=0)
		{
			System.out.println("有该用户");
			return list.get(0);
		}
		else
		{
			System.out.println("没有有该用户");
			return null;
		}
	}

	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	public User login(User user) {
		List<User> list = this.getHibernateTemplate().find("from User where username=? and password=? and state=?",user.getUsername(),user.getPassword(),1);
		
		if(list.size() != 0)
		{
			return list.get(0);
		}
		else
			return null;
	}
	public User findByUserName(String username) {
		List<User> list = this.getHibernateTemplate().find("from User where username = ?",username);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}

	public Integer findCount() {
		String hql ="select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size()>0)
			return list.get(0).intValue();
		return null;
	}

	public List<User> findByPage(Integer begin, Integer limit) {
		String hql = "from User";
		List<User> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<User>(hql, null, begin, limit));
		if(list.size()>0) {
			return list;
		}
		return null;
	}

	public User findById(Integer id) {
		User user = this.getHibernateTemplate().get(User.class, id);
		return user;
	}

	public void delete(User oldUser) {
		this.getHibernateTemplate().delete(oldUser);
	}

}
