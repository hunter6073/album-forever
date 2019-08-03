package com.tedu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tedu.dao.CommDao;
import com.tedu.dao.indexMenuDao;
import com.tedu.entity.CartItem;
import com.tedu.service.CartService;


@Controller
public class CartController {
	@Resource
	public CartService cartService;
	
	//����service�����ع��ﳵCart
	@RequestMapping("/getCart.form")
	public String cartList(String username,ModelMap map){
		List<CartItem> cart = cartService.getCart(username);
		map.addAttribute("cart", cart);
		return "cart";
	}

	
	//����service�����ع��ﳵ�е���Ʒ����
	@RequestMapping("/modifyNumber.form")
	@ResponseBody
	public String modifyNumber(String username,String albumid,int number){
		int n = cartService.modifyNumber(username, albumid, number);
		return String.valueOf(n);
	}
	
	//����service��ɾ���ﳵ�е�ĳһ����Ʒ
	@RequestMapping("/deleteCartItem.form")
	@ResponseBody
	public String deleteCartItem(String username, String albumid){
		cartService.deleteCartItem(username, albumid);
		return "success";
	}
	//����service������һ�������е���Ʒ��Ϣ
	@RequestMapping("/insertOrder.form")
	@ResponseBody
	public String insertOrder(@RequestParam("album[]")List<String> albumid,
				@RequestParam("number[]")List<String> number,
				String username,float total,
				@RequestParam("subtotal[]")List<Float> subTotal){
		String receiptid = cartService.insertOrder(username, albumid, number, subTotal, total);
		//插入购物车信息，购物车部分添加内容，编写人:王鹤淳
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		CommDao dao = ac.getBean(CommDao.class);
		for(int i=0;i<albumid.size();i++)
		{
			dao.setcartreceipt(receiptid,username,albumid.get(i));
		}
		//删除购物车中购买过的物品信息，编写人:王鹤淳

	    
		////////////////////////////////////////////////////////
		
		
		return "getPay.form?username="+username+"&receiptid="+receiptid;
	}
}
