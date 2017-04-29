package shop.index;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.springframework.stereotype.Component;

import shop.category.Category;
import shop.category.CategoryService;
import shop.product.Product;
import shop.product.ProductService;

//首页访问的Action
@Component
public class IndexAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//注入一级分类的service
	private CategoryService categoryService;
	
	//注入商品的service
	private ProductService productService;
	
	//热门商品集合
	private List<Product> hotList;
	
	//最新商品集合
	private List<Product> newList;
	
	public List<Product> getNewList() {
		return newList;
	}

	public List<Product> getHotList() {
		return hotList;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@Override
	public String execute() throws Exception {
		
		//查询所有的一级分类
		List<Category>  categoryList = categoryService.findAll();
		// 存入到Session
		ActionContext.getContext().getSession().put("categoryList", categoryList);
		
		//查询热门商品
		hotList = productService.findHod();
		
		//查询最新商品
		newList = productService.findNew();
		
		
		return "indexSuccess";
	}

}
