package it.unisa.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

public class AddressList {
	
	private static UserDaoImpl userDao = new UserDaoImpl();
	private static AddressDaoImpl addressDao = new AddressDaoImpl();
	private ArrayList<AddressBean> addressList;
	private ArrayList<AddressScript> addressListScript;
	
	public AddressList(UserBean user) {
		
		try {
			user = userDao.findByCred(user.getEmail(),user.getPassword());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		setAddressList(new ArrayList<AddressBean>());
		addressListScript = new ArrayList<AddressScript>();
		
		try {
			setAddressList(addressDao.findByID(user.getId()));
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		for(int i = 0; i < addressList.size(); i ++)
		{
			addressListScript.add(new AddressScript(addressList.get(i)));
		}		
		
	}
	
	public void removeAddress(AddressBean address) {
		addressList.remove(address);
		try {
			addressDao.deleteAddress(address);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AddressBean> getAddressList() {
		return addressList;
	}

	public void setAddressList(ArrayList<AddressBean> addressList) {
		this.addressList = addressList;
	}

	public ArrayList<AddressScript> getAddressListScript() {
		return addressListScript;
	} 
	
	public String getJson() {
		
		Gson gson = new Gson();
		String json = gson.toJson(addressListScript);
		
		return json;
	}
	
}
