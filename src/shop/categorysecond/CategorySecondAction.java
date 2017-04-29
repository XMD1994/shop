package shop.categorysecond;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import shop.category.Category;
import shop.category.CategoryService;
import shop.utils.PageBean;
public class CategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	
	private Integer page;//接收页数（提供set方法）
	private CategorySecond categorySecond = new CategorySecond();//模型驱动
	private Integer cid;//接收cid
	
	private CategorySecondService categorySecondService;//注入service（提供set方法）
	private CategoryService categoryService;//注入一级分类的service
	

	public void setPage(Integer page) {
		this.page = page;
	}
	@Override
	public CategorySecond getModel() {
		// TODO Auto-generated method stub
		return categorySecond;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	/*
	 * 二级分类管理：查询所有的二级分类（带分页）
	 * 
	 * */
	public String adminFindAll()
	{
		PageBean<CategorySecond> pageBean = categorySecondService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "adminFindAllSuccess";
		
	}
	/*
	 * 二级分类管理：跳转到添加页面的方法
	 * 
	 * */
	public String addPage()
	{
		//查询一级分类列表
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}
	/*
	 * 二级分类的保存操作
	 * 
	 * */
	public String save()
	{
		Category category = new Category();
		category.setCid(cid);
		categorySecond.setCategory(category);
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	
	/*
	 * 后台编辑二级级分类（查询一级分类）
	 * */
	public String edit()
	{
		//查询一级分类列表
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		return "editSuccess";
	}
	
	public String update() {
		categorySecondService.update(categorySecond);
		return"updateSuccess";
	}
	
	public String delete() {
		categorySecondService.delete(categorySecond);
		
		return "deleteSuccess";
	}
	
}
