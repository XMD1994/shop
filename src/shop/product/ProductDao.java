package shop.product;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.utils.PageHibernateCallback;

public class ProductDao extends HibernateDaoSupport {
	
	//查询热门产品，只显示10个
	public List<Product> findHod() {
		//分页方法一
		/*DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("is_hot", 1));
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);*/
		
		List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>("from Product where is_hot=?", new Object[]{1}, 0, 10));
		return list;
	}

	public List<Product> findNew() {
		List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>("from Product order by pdate desc", null, 0, 10));
		return list;
	}
	//统计某个分类的记录数
	public int findCountByCid(Integer cid) {
		List<Long> list = this.getHibernateTemplate().find("select count(*) from Product p ,CategorySecond cs where p.categorySecond = cs and cs.category.cid = ?",cid);
		return list.get(0).intValue();
	}
	
	//分页查询商品集合
	public List<Product> findByPage(Integer cid, int begin, int limit) {
		String hql = "select p from Product p , CategorySecond cs where p.categorySecond = cs and cs.category.cid = ?";
		List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		return list;
	}

	public Product findByPid(Integer pid) {
		
		return this.getHibernateTemplate().get(Product.class, pid);
	}

	public int findCountByCsid(Integer csid) {
		String hql = "select count(*) from Product p join p.categorySecond cs where cs.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,csid);
		return list.get(0).intValue();
	}

	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
		List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		return list;
	}

	public Integer findCount() {
		String hql ="select count(*) from Product";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size()>0)
			return list.get(0).intValue();
		return null;
	}
	public List<Product> findByPage(Integer begin, Integer limit) {
		String hql = "from Product";
		List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list.size()>0)
			return list;
		return null;
	}

	public void save(Product product) {
		this.getHibernateTemplate().save(product);
	}

	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}


}