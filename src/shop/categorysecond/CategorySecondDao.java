package shop.categorysecond;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.utils.PageHibernateCallback;

public class CategorySecondDao extends HibernateDaoSupport{

	public Integer findCount() {
		List<Long> list = this.getHibernateTemplate().find("select count(*) from CategorySecond");
		if(list.size()>0)
			return list.get(0).intValue();
		else
			return null;
	}

	public List<CategorySecond> findByPage(Integer begin, Integer limit) {
		String hql = "from CategorySecond";
		List<CategorySecond> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<CategorySecond>(hql, null, begin, limit));
		if(list.size()>0)
			return list;
		return null;
	}

	public void save(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);		
	}

	public List<CategorySecond> findAll() {
		List<CategorySecond> csList = this.getHibernateTemplate().find("from CategorySecond");
		if(csList.size()>0)
			return csList;
		return null;
	}

	public CategorySecond findByCsid(Integer csid) {
		
		return this.getHibernateTemplate().get(CategorySecond.class, csid);
	}

	public void update(CategorySecond categorySecond) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(categorySecond);
	}

	public void delete(CategorySecond categorySecond) {
		this.getHibernateTemplate().delete(categorySecond);
	}

	

}
