package shop.cart;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/*
 * 购物车的实体类
 * */
public class Cart {
	
	//购物车的多个购物项
	//用商品的id作key ；购物项作value
	private Map<Integer, CartItem> cartItems = new HashMap<Integer, CartItem>();
	
	public Collection<CartItem> getCartItemSet()
	{
		return cartItems.values();
	}
	
	//总计
	private Double total = 0.0;
	
	public Double getTotal() {
		return total;
	}
	//加入购物车方法
	public void addItem(CartItem cartItem)
	{
		//获得购物项中商品的pid
		Integer pid = cartItem.getProduct().getPid();
		//购物车有这个购物项
		if(cartItems != null && cartItems.containsKey(pid))
		{
			CartItem existItem = cartItems.get(pid);
			existItem.setCount(existItem.getCount()+cartItem.getCount());
		}
		else if(cartItems == null)
		{
			cartItems = new HashMap<Integer, CartItem>();
			cartItems.put(pid, cartItem);
		}
		//购物车没有这个购物项
		else
		{
			cartItems.put(pid, cartItem);
		}
		total += cartItem.getSubtotal();
	}
	//删除购物车的某个购物项方法
	public void removeItemByPid(Integer pid)
	{
		//从map中移除一个项
		CartItem cartItem = cartItems.remove(pid);
		//总计减去相应的金额
		total -= cartItem.getSubtotal();
	}
	//清空购物车
	public void clearCart()
	{
		//清空map
		cartItems =  null;
		//总计设0
		total = 0.0;
	}
}
