package shop.category;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryDao extends HibernateDaoSupport {
	
	//Dao查询所有一级分类的方法
	/*public List<Category> findAll() {
		List<Category> list = this.getHibernateTemplate().find("from Category");
		System.out.println("-----------------------------");
		if(list.size() != 0)
		{
			System.out.println("--------------list.size---------------");
			return list;
		}
		else
			return null;
	}*/
	
	// DAO层的查询所有的一级分类的代码
	public List<Category> findAll() {
		return this.getHibernateTemplate().find("from Category");
	}
	//DAO层添加一级分类方法
	public void save(Category category) {
		this.getHibernateTemplate().save(category);
	}
	//DAO层删除一级分类方法
	public void delete(Category category) {
		category = this.getHibernateTemplate().get(Category.class, category.getCid());//做级联删除前要先查询一下
		this.getHibernateTemplate().delete(category);
		
	}
	public Category findByCid(Integer cid) {
		
		return this.getHibernateTemplate().get(Category.class, cid);
	}
	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}

}
