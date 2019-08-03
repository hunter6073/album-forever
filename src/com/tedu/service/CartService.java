package com.tedu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tedu.dao.CartDao;
import com.tedu.entity.CartItem;
import com.tedu.entity.OrderItem;
import com.tedu.entity.Receipt;

@Service
public class CartService {
	@Resource
	private CartDao dao;
	@Resource
	private CartItem cartItem;
	@Resource
	private Receipt receipt;
	
	//���username��ȡ���ﳵ��Ϣ
	public List<CartItem> getCart(String username){
		List<CartItem> cart = dao.findCart(username);
		return cart;
	}
	//�޸Ĺ��ﳵĳһ��Ʒ������
	public int modifyNumber(String username,String albumid,int number){
		cartItem.setAlbumid(albumid);
		cartItem.setUsername(username);
		int storage = dao.getStorage(cartItem);
		if(storage >= number){
			cartItem.setNumber(number);
			dao.modifyNumber(cartItem);
		} else {
			cartItem.setNumber(storage);
			dao.modifyNumber(cartItem);
		}
		int n = dao.getNumber(cartItem);
		return n;
	}

	//ɾ���ﳵ���ĳһ��Ʒ
	public void deleteCartItem(String username, String albumid){
		cartItem.setAlbumid(albumid);
		cartItem.setUsername(username);
		dao.deleteCartItem(cartItem);
	}
	//���빺�ﳵ����ݵ�������
	public String insertOrder(String username, List<String> albumidList, List<String> numberList, List<Float> subTotal, float total) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String id_user = dao.getID(username);
		String receiptid = id_user+df.format(new Date());
		receipt.setReceiptid(receiptid);
		receipt.setStatus("unfinished");
		receipt.setUsername(username);
		receipt.setTotal(total);
		
		List<OrderItem> order = new ArrayList<OrderItem>();
		for(int i=0; i<albumidList.size(); i++){
			OrderItem orderItem = new OrderItem();
			orderItem.setAlbumid(albumidList.get(i));
			orderItem.setNumber(numberList.get(i));
			orderItem.setReceiptid(receiptid);
			orderItem.setSubTotal(subTotal.get(i));
			order.add(orderItem);
		}
		
		dao.insertReceipt(receipt);
		dao.insertOrder(order);
		return receipt.getReceiptid();
	}
}
