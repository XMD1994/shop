package shop.product;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import shop.category.Category;
import shop.category.CategoryService;
import shop.categorysecond.CategorySecond;
import shop.categorysecond.CategorySecondService;
import shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 商品访问的Action类
 * 
 * */
public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	
	//文件上传需要的三个属性
	private File upload; //上传文件 与input标签的name相同
	private String uploadContentType;//上传文件的MIME类型
	private String uploadFileName;//上传文件名称
	
	
	//接受前台的查询cid
	private Integer cid;
	
	public Integer getCid() {
		return cid;
	}

	

	//接收当前页数
	private Integer page;
	
	//注入ProductService
	private ProductService productService;
	
	//分页商品显示
	private PageBean<Product> pageBean;
	
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}



	//模型驱动类
	private Product product = new Product();
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return this.product;
	}
	
	//接收二级分类Csid
	private Integer csid;
	
	private CategorySecondService categorySecondService;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public Integer getCsid() {
		return csid;
	}

	public PageBean<Product> getPageBean() {
		return pageBean;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	//注入一级分了的service	
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	//查询商品的方法
	public String findByCid()
	{
		//查询所有的一级分类
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("categoryList", categoryList);
		
		//查询商品
		pageBean = productService.findByPage(cid,page);
		
		return "findByCidSuccess";
	}

	//查询商品详情
	public String findByPid()
	{
		//查询所有的一级分类
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("categoryList", categoryList);
		product = productService.findByPid(this.product.getPid());
		return "findByPidSuccess";
	}
	//根据二级分类来显示商品
	public String findByCsid()
	{
		//查询所有的一级分类
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("categoryList", categoryList);
		pageBean = productService.findByCsid(page,csid);
		return "findByCsidSuccess";
		
	}
	
	/*
	 * 
	 * 后台：查询所有商品的方法
	 * 
	 * */
	public String adminFindAll()
	{
		pageBean = productService.findByPage(page);
		return "adminFindAllSuccess";
	}
	/*
	 * 
	 * 后台：跳转到添加页面
	 * 
	 * */
	public String addPage()
	{
		List<CategorySecond> csList = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "addPageSuccess";
	}
	
	/*
	 * 保存商品同时上传图片
	 * 
	 * */
	public String save()
	{
		//文件上传的操作
		//获得人间上传的路径
		String path = ServletActionContext.getServletContext().getRealPath("products");
		String realPath = path +"/"+csid+"/"+uploadFileName;
		File diskFile = new File(realPath);
		try {
			FileUtils.copyFile(upload, diskFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CategorySecond categorySecond = new CategorySecond();
		categorySecond.setCsid(csid);
		product.setCategorySecond(categorySecond);
		//product.setPdate(new Date());
		product.setImage("products/"+csid+"/"+uploadFileName);
		productService.save(product);
		return "saveSuccess";
	}
	
	public String editPage() {
		product = productService.findByPid(product.getPid());
		List<CategorySecond> csList = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);		
		return "editPage";
	}
	
	public String doEdit() {
		//文件上传的操作
		//获得人间上传的路径
		String path = ServletActionContext.getServletContext().getRealPath("products");
		String realPath = path +"/"+csid+"/"+uploadFileName;
		File diskFile = new File(realPath);
		if(upload != null) {
			try {
				FileUtils.copyFile(upload, diskFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setImage("products/"+csid+"/"+uploadFileName);
		}
		CategorySecond categorySecond = new CategorySecond();
		categorySecond.setCsid(csid);
		product.setCategorySecond(categorySecond);
		//product.setPdate(new Date());
		
		Product old = productService.findByPid(product.getPid());
		
		if(null == product.getImage() || "".equals(product.getImage())) {
			product.setImage(old.getImage());
		}
		
		if(null == product.getPdesc() || "".equals(product.getPdesc())) {
			product.setPdesc(old.getPdesc());
		}
		
		productService.update(product);
		
		return "editSuccess";
	}
	public String delete() {
		
		productService.delete(product);
		return "deleteSuccess";
	}
}
