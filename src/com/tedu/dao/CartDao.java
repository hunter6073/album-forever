package com.tedu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tedu.entity.Address;
import com.tedu.entity.CartItem;
import com.tedu.entity.OrderItem;
import com.tedu.entity.Receipt;

@Repository
public interface CartDao {
	
	public List<CartItem> findCart(String username);
	public String modifyNumber(CartItem cartItem);
	public int getNumber(CartItem cartItem);
	public void deleteCartItem(CartItem cartItem);
	public void insertReceipt(Receipt receipt);
	public String getID(String username);
	public void insertOrder(List<OrderItem> order);
	public Address getAddress(String username);
	public List<OrderItem> findOrder(String receiptid);
	public float getTotal(String receiptid);
	public void updateAddress(Address address);
	public void updateStatus(Map<String,String> map);
	public int getStorage(CartItem cartItem);
	public List<OrderItem> findAlbumidFromOrder(String receiptid);
	public String modifyStorage(OrderItem orderItem);

}
