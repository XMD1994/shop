package shop.cart;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import shop.product.Product;
import shop.product.ProductService;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 购物模块的action
 * 
 * */

public class CartAction extends ActionSupport{
	
	//接收pid
	private Integer pid;
	
	//接收数量
	private Integer count;
	
	//注入productService 用以查询商品信息
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	/*
	 * 从session获取购物车
	 * 
	 * */
	public Cart getCart(HttpServletRequest request)
	{
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
		
	}

	/* 
	 * 添加购物车方法
	 * */
	public String addCart()
	{
		//查找商品信息
		Product product = productService.findByPid(pid);
		
		//封装出购物项
		CartItem cartItem = new CartItem();		
		cartItem.setProduct(product);
		cartItem.setCount(count);
		
		//获取购物车
		Cart cart = getCart(ServletActionContext.getRequest());
		
		cart.addItem(cartItem);
		
		return "addCartSucccess";
	}
	
	/*
	 * 清空购物车
	 * */
	public String clearCart()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		Cart cart = getCart(request);
		cart.clearCart();
		return "clearCartSuccess";
	}
	
	/*
	 * 移除购物项
	 * */
	public String removeCart()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		Cart cart = getCart(request);
		cart.removeItemByPid(pid);
		return "removeCartSuccess";
	}
	/*
	 * 我的购物车
	 * */
	public String myCart()
	{
		return "myCartSuccess";
	}
}
