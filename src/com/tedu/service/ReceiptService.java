package com.tedu.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.tedu.dao.CartDao;
import com.tedu.dao.CommDao;
import com.tedu.entity.Address;
import com.tedu.entity.OrderItem;
import com.tedu.util.PaymentUtil;

@Service
public class ReceiptService {
	@Resource
	private CartDao dao;
	@Resource
	private Address addr;
	
	//��ö������ܽ��
	public float getTotal(String receiptid){
		float total = dao.getTotal(receiptid);
		return total;
	}
	//����û������ջ���ַ
	public Address getAddress(String username){
		Address addr = dao.getAddress(username);
		return addr;
	}
	//��ݶ����Ż�ö�����Ʒ
	public List<OrderItem> getOrder(String receiptid){
		List<OrderItem> order = dao.findOrder(receiptid);
		return order;
	}
	//�����ջ���ַ��Ϣ
	public void updateAddress(String username,String address,String receivename,String phone,String postalcode){
		addr.setUsername(username);
		addr.setAddress(address);
		addr.setReceivename(receivename);
		addr.setPhone(phone);
		addr.setPostalcode(postalcode);
		dao.updateAddress(addr);
	}
	//���õ���֧������
	public ModelMap toSure(String receiptid,String total,String pd_FrpId,ModelMap map,HttpServletRequest request){
		String p0_Cmd = "Buy";//ҵ������(����)
		String p1_MerId = "10001126856";//�̻����
		String p2_Order = receiptid;//������
		String p3_Amt = total;//�������
		String p4_Cur = "CNY";//���ױ���(ChiNa Yuan)
		String p5_Pid = "album";  //��Ʒ���(���ڻ������ǵ���Ʒ���<����"JavaEEʵ��">)
		String p6_Pcat = "unknown";//��Ʒ����(���ڻ������ǵ���Ʒ����<С˵��ɢ�ĵ�>)
		String p7_Pdesc = "descrition";//��������(���ڻ������ǵĶ���������Ϣ)
		//p8_Url:����֧����ɵĵ�ַ
		String p8_Url = "http://localhost:8088"+request.getContextPath()+"/responsePay.form";
		String p9_SAF = "0";//�ͻ���ַ(���ڻ���ѡ����ջ���ַ)
		String pa_MP = "unknown";//�̻���չ��Ϣ
		String pr_NeedResponse="1"; //Ӧ�����
		String pr_key="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";//�̻���Կ
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, pr_key);
		map.addAttribute("p0_Cmd",p0_Cmd );
		map.addAttribute("p1_MerId",p1_MerId );
		map.addAttribute("p2_Order", p2_Order);
		map.addAttribute("p3_Amt", p3_Amt);
		map.addAttribute("p4_Cur",p4_Cur );
		map.addAttribute("p5_Pid",p5_Pid );
		map.addAttribute("p6_Pcat",p6_Pcat );
		map.addAttribute("p7_Pdesc",p7_Pdesc );
		map.addAttribute("p8_Url",p8_Url );
		map.addAttribute("pa_MP",pa_MP );
		map.addAttribute("pr_NeedResponse",pr_NeedResponse );
		map.addAttribute("hmac",hmac );
		map.addAttribute("p9_SAF",p9_SAF );
		map.addAttribute("pd_FrpId", pd_FrpId);
		return map;
	}
	//����֧����ִ
	public boolean responsePay(String hmac,String p1_MerId,String r0_Cmd,String r1_Code,
			String r2_TrxId,String r3_Amt,String r4_Cur,String r5_Pid,String r6_Order,String r7_Uid,String r8_MP,String r9_BType){
		boolean ok = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");
		return ok;
	}
	//��Ķ��������״̬���������ʱ��
	public void updateStatus(String receiptid){
		List<OrderItem> albumidList = dao.findAlbumidFromOrder(receiptid);
		for(int i=0; i<albumidList.size(); i++){
			dao.modifyStorage(albumidList.get(i));
		}
		SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pdate = pdf.format(new Date());
		Map<String,String> map = new HashMap<String, String>();
		map.put("receiptid", receiptid);
		map.put("pdate", pdate);
		map.put("status", "finished");
		dao.updateStatus(map);
		
		
	}

}
