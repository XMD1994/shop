package shop.categorysecond;

import java.util.HashSet;
import java.util.Set;

import shop.category.Category;
import shop.product.Product;


/*
 * 二级分类的实体类
 * */
public class CategorySecond {
	
	private Integer csid;
	private String csname;
	//二级分类所属的一级分类
	private Category category;
	
	//关联的商品集合
	private Set<Product> products = new HashSet<Product>();
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	

}
