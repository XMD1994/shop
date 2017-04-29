package shop.order;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import shop.cart.Cart;
import shop.cart.CartItem;
import shop.user.User;
import shop.utils.PageBean;
import shop.utils.PaymentUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 订单的 Action
 * */
public class OrderAction extends ActionSupport {
	private Order order;
	private String pd_FrpId;
	
	private String r3_Amt;
	private String r6_Pcat;
	
	private Integer oid;
	
	//后台查询需要的page和state
	private Integer page;
	private Integer state;
	
	private Integer paytype;
	
	public Integer getPaytype() {
		return paytype;
	}

	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public void setP3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public void setP6_Pcat(String r6_Pcat) {
		this.r6_Pcat = r6_Pcat;
	}
	private OrderService orderService;
	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	
	public Order getOrder() {
		return order;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	//保存订单
	public String saveOrder()
	{
		order = new Order();
		//封装订单
		Date date=new Date();
        SimpleDateFormat temp=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
        String date2=temp.format(date);
        Date date3 = null;
        try {
			date3=temp.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		order.setOrdertime(date3);
		order.setState(1); // 1 未付款   2 已经付款.  3.已经发货   4 已经收货.
		
		//获取购物车
		HttpServletRequest request = ServletActionContext.getRequest();
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null)
		{
			this.addActionMessage("你的购物车还是空的");
			return "msg";
		}
		
		
		order.setTotal(cart.getTotal());
		
		User existUser = (User) request.getSession().getAttribute("existUser");
		if(existUser == null)
		{
			this.addActionMessage("请先登入");
			return "msg";
		}
		order.setUser(existUser);
		
		for(CartItem cartItem : cart.getCartItemSet())
		{
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);
			
			order.getOrderItems().add(orderItem);
		}
		
		cart.clearCart();
		
		Integer oid = orderService.save(order);
		order.setOid(oid);
		//order = orderService.findByOid(oid);
		return "saveOrderSuccess";
	}
	
	//付款方法
	public String payOrder()
	{
		if(paytype == 1) {
			return orderPay();
		} 
		//修改订单
		//查询这个Id的订单
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		
		orderService.update(currOrder);
		
		//付款
		//定义付款参数
		String p0_Cmd = "Buy";//业务类型
		String p1_MerId = "10001126856";
		String p2_Order = order.getOid().toString();
		String p3_Amt = "0.01";
		String p4_Cur = "Buy";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		String p8_Url = "http://182.98.135.144:9999/order_callBack.action";
		String p9_SAF= "";
		String pa_MP= "";
		String pr_NeedResponse = "1";
		String keyValue="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		
		StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.sendRedirect(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
		
	}
	//付款成功的回掉方法
	public String callBack()
	{
		Order currOrder = orderService.findByOid(Integer.parseInt(r6_Pcat));
		currOrder.setState(2);//修改订单状态
		orderService.update(currOrder);
		
		this.addActionMessage("订单付款成功！订单号："+r6_Pcat+"付款金额："+r3_Amt);
		return "msg";
	}
	/*
	 * 按用户的id查询订单
	 * */
	public String findByUid()
	{
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Order> oList = orderService.findByUid(existUser.getUid());
		
		ActionContext.getContext().getValueStack().set("oList", oList);
		return "findByUidSuccess";
	}
	public String findByOid()
	{
		order = orderService.findByOid(oid);
		return "findByOidSuccess";
	}
	/*
	 * 前台修改订单状态
	 * */
	public String updateState()
	{
		order = orderService.findByOid(oid);
		order.setState(4);
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	public String delete() {
		order = orderService.findByOid(oid);
		if(order.getState() != 3)
		{
			orderService.delete(order);
		}
		return "deleteSuccess";
	}
	/*
	 * 后台查询订单按状态
	 * 
	 * 
	 * */
	public String adminFindByState()
	{
		PageBean<Order> pageBean = orderService.findByPage(page,state);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "adminFindByStateSuccess";
	}
	
	/*
	 * 后台所有查询订单
	 * 
	 * 
	 * */
	public String adminFindAll()
	{
		PageBean<Order> pageBean = orderService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "adminFindAllSuccess";
	}
	/*
	 * 后台修改订单状态
	 * */
	public String adminUpdateState()
	{
		order = orderService.findByOid(oid);
		order.setState(3);
		orderService.update(order);
		return "adminUpdateStateSuccess";
	}
	
	private String orderPay() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(-2);
		orderService.update(currOrder);
		return "paySuccess";
	}
}

 