package com.tedu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tedu.dao.CommDao;
import com.tedu.entity.Address;
import com.tedu.entity.OrderItem;
import com.tedu.service.ReceiptService;
@Controller
public class ReceiptController {
	@Resource
	public ReceiptService receiptService;
	
	//����service�����ص�ַ�Ͷ�����Ʒ
	@RequestMapping("/getPay.form")
	public String orderList(String username,String receiptid,ModelMap map){
		Address address = receiptService.getAddress(username);
		List<OrderItem> order = receiptService.getOrder(receiptid);
		float total = receiptService.getTotal(receiptid);
		map.addAttribute("address", address);
		map.addAttribute("order", order);
		map.addAttribute("total", total);
		map.addAttribute("receiptid", receiptid);
		map.addAttribute("username", username);
		return "pay";
	}
	
	//����service�������ջ���ַ
	@RequestMapping("/updateAddress.form")
	@ResponseBody
	public String updateAddress(String username,String address,String receivename,String phone,String postalcode){
		receiptService.updateAddress(username,address,receivename,phone,postalcode);
		return "success";
	}
	
	//����service�������ջ���ַ
	@RequestMapping("/getAddress.form")
	@ResponseBody
	public Address getAddress(String username){
		Address addr = receiptService.getAddress(username);
		return addr;
	}
	
	//����service����ת��֧��ҳ��
	@RequestMapping("/toPay.form")
	public String toPay(String receiver_toPay,String receiptid_toPay,String total_toPay, ModelMap map){
		map.addAttribute("receiver",receiver_toPay);
		map.addAttribute("receiptid",receiptid_toPay);
		map.addAttribute("total",total_toPay);
		return "payWay";
	}
	
	@RequestMapping("/toSure.form")
	public String toSure(String receiptid, String total,String pd_FrpId,HttpServletRequest request,ModelMap map){
		map = receiptService.toSure(receiptid, total, pd_FrpId, map, request);
		return "sure";
	}
	
	@RequestMapping("/responsePay.form")
	public String responsePay(String hmac,String p1_MerId,String r0_Cmd,String r1_Code,
			String r2_TrxId,String r3_Amt,String r4_Cur,String r5_Pid,String r6_Order,String r7_Uid,String r8_MP,String r9_BType,ModelMap map){
		boolean ok = receiptService.responsePay(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType);
		if(ok){
			receiptService.updateStatus(r6_Order);
			return "redirect:toFinished.form?receiptid="+r6_Order+"&total="+r3_Amt;
		} else {
			map.addAttribute("payResult","false");
			return "finished";
		}
		
	}
	@RequestMapping("/toFinished.form")
	public String responsePay(String receiptid,String total,ModelMap map){
		
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("springMVC.xml");
		CommDao dao = ac.getBean(CommDao.class);
		receiptService.updateStatus(receiptid);
		dao.deletefromcart(receiptid);
		map.addAttribute("payResult","true");
		map.addAttribute("receiptid",receiptid);
		map.addAttribute("total",total);

		return "finished";
	}
}
