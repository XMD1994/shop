package shop.category;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

//开启事务
@Transactional
public class CategoryService {
	//注入Dao
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	// 业务层查询所有的一级分类的方法
	public List<Category> findAll() {
		return categoryDao.findAll();
	}
	//业务层保存一个一级分类的方法
	public void save(Category category) {
		categoryDao.save(category);
		
	}
	public void delete(Category category) {
		categoryDao.delete(category);
		
	}
	public Category findByCid(Integer cid) {
		
		return categoryDao.findByCid(cid);
	}
	public void update(Category category) {
		categoryDao.update(category);
		
	}
}
