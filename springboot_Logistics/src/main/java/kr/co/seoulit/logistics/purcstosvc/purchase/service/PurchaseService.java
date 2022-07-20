package kr.co.seoulit.logistics.purcstosvc.purchase.service;

import java.util.ArrayList;

import org.springframework.ui.ModelMap;

import kr.co.seoulit.logistics.purcstosvc.purchase.to.OrderInfoTO;
import kr.co.seoulit.logistics.purcstosvc.purchase.to.OutSourcingTO;

public interface PurchaseService {
	
	public ArrayList<OutSourcingTO> searchOutSourcingList(String fromDate,String toDate,String customerCode,String itemCode,String materialStatus);
	
	public ModelMap getOrderList(String startDate, String endDate);
	
	public ModelMap getOrderDialogInfo(String mrpNoArr);
	
	public ModelMap order(ArrayList<String> mrpGaNoArr);
	
	public ModelMap optionOrder(String itemCode, String itemAmount);
	
	public ArrayList<OrderInfoTO> getOrderInfoListOnDelivery();
	
	public ArrayList<OrderInfoTO> getOrderInfoList(String startDate,String endDate);

	public ModelMap checkOrderInfo(ArrayList<String> orderNoArr);
	
}
