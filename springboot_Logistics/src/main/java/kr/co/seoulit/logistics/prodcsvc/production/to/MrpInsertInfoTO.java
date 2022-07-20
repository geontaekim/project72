package kr.co.seoulit.logistics.prodcsvc.production.to;

import lombok.Data;

@Data
public class MrpInsertInfoTO {
	private String firstMrpNo;
	private String lastMrpNo;
	private String length;
	public String getFirstMrpNo() {
		return firstMrpNo;
	}
	public void setFirstMrpNo(String firstMrpNo) {
		this.firstMrpNo = firstMrpNo;
	}
	public String getLastMrpNo() {
		return lastMrpNo;
	}
	public void setLastMrpNo(String lastMrpNo) {
		this.lastMrpNo = lastMrpNo;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	
	
}
