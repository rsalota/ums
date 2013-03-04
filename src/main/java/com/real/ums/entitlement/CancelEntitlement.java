package com.real.ums.entitlement;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;


@RooJson
@RooJavaBean
@RooToString
public class CancelEntitlement {
	private String entitlementKey;
	private String cancelReason;
	private String status;
	
	public String getEntitlementKey() {
		return entitlementKey;
	}
	public void setEntitlementKey(String entitlementKey) {
		this.entitlementKey = entitlementKey;
	}
	public String getCancelReason() {
		return cancelReason;
	}
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
