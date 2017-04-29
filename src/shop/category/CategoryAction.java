package shop.category;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	//模型驱动
	private Category category = new Category();
	
	//注入service
	private CategoryService categoryService;
	
	@Override
	public Category getModel() {
		// TODO Auto-generated method stub
		return category;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}


	/*
	 * 后台：查询一级分类方法
	 * */
	public String adminFindAll()
	{
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "adminFindAllSuccess";
	}
	/*
	 * 后台：保存一级分类方法
	 * */
	public String save()
	{
		categoryService.save(category);
		return "saveSuccess";
	}

	/*
	 * 后台删除一级分类的方法
	 * 
	 * */
	public String delete()
	{
		categoryService.delete(category);
		return "deleteSuccess";
	}
	/*
	 * 后台编辑一级分类（查询一级分类）
	 * */
	public String edit()
	{
		category = categoryService.findByCid(category.getCid());
		return "editSuccess";
	}
	/*
	 * 后台修改一节分类
	 * */
	public String update()
	{
		categoryService.update(category);
		return "updateSuccess";
	}
}
