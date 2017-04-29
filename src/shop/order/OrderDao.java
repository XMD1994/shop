package shop.order;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.utils.PageHibernateCallback;

public class OrderDao extends HibernateDaoSupport{
	//持久层保存订单
	public Integer save(Order order) {
		Integer oid = (Integer) this.getHibernateTemplate().save(order);
		return oid;
	}

	public Order findByOid(Integer oid) {
		Order order = this.getHibernateTemplate().get(Order.class, oid);
		return order;
	}

	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
	}

	public List<Order> findByUid(Integer uid) {
		List<Order> oList = this.getHibernateTemplate().find("from Order o where o.user.uid = ? order by ordertime desc",uid);
		return oList;
	}
	//持久层查询数量
	public Integer findCount() {
		List<Long> list = this.getHibernateTemplate().find("select count(*) from Order");
		if(list.size()>0)
			return list.get(0).intValue();
		return null;
	}

	public List<Order> findByPage(Integer begin, Integer limit) {
		String hql ="from Order order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql, null, begin, limit));
		return list;
	}

	public Integer findCount(Integer state) {
		List<Long> list = this.getHibernateTemplate().find("select count(*) from Order where state = ?",state);
		if(list.size()>0)
			return list.get(0).intValue();
		return null;
	}

	public List<Order> findByPage(Integer state, Integer begin, Integer limit) {
		String hql = "from Order where state=? order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql, new Object[]{state}, begin, limit));
		return list;
	}

	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
	}

}
