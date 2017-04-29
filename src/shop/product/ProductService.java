package shop.product;

import java.util.List;

import shop.utils.PageBean;


public class ProductService {
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	//业务层查询热门商品
	public List<Product> findHod() {
		
		return productDao.findHod();
	}
	//业务层查询最新商品
	public List<Product> findNew() {
		
		return productDao.findNew();
	}
	
	//分类页面的显示商品的方法
	public PageBean<Product> findByPage(Integer cid, Integer page) {
		int limit = 12;//每页显示记录数
		int totalPage = 1;
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		Integer totalCount = productDao.findCountByCid(cid);
		pageBean.setTotalCount(totalCount);
		//总页数的封装
		if(totalCount % limit == 0)
		{
			totalPage = totalCount / limit;
		}
		else
		{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//商品数据集合
		int begin = (page-1)*limit;
		List<Product> list = productDao.findByPage(cid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	//业务层查询商品详情
	public Product findByPid(Integer pid) {
		return productDao.findByPid(pid);
	}
	
	//根据二级分类的id查询商品
	public PageBean<Product> findByCsid(Integer page,Integer csid) {
		int limit = 12;//每页显示记录数
		int totalPage = 1;
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		int totalCount = productDao.findCountByCsid(csid);
		pageBean.setTotalCount(totalCount);
		if(totalCount % limit == 0)
		{
			totalPage = totalCount / limit;
		}
		else
		{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<Product> list = productDao.findByPageCsid(csid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		Integer limit = 10;
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		Integer totalCount = productDao.findCount();
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
		List<Product> list = productDao.findByPage( begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	//业务层保存商品
	public void save(Product product) {
		productDao.save(product);
	}
	public void delete(Product product) {
		productDao.delete(product);
		
	}
	public void update(Product product) {
		productDao.update(product);
	}
	
	
}
