// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.real.ums.entitlement;

import com.real.ums.entitlement.Entitlement;
import com.real.ums.entitlement.EntitlementBillingInfo;
import java.util.Date;

privileged aspect Entitlement_Roo_JavaBean {
    
    public Long Entitlement.getServiceId() {
        return this.serviceId;
    }
    
    public void Entitlement.setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }
    
    public String Entitlement.getEntitlementKey() {
        return this.entitlementKey;
    }
    
    public void Entitlement.setEntitlementKey(String entitlementKey) {
        this.entitlementKey = entitlementKey;
    }
    
    public String Entitlement.getUserGuid() {
        return this.userGuid;
    }
    
    public void Entitlement.setUserGuid(String userGuid) {
        this.userGuid = userGuid;
    }
    
    public String Entitlement.getStermCode() {
        return this.stermCode;
    }
    
    public void Entitlement.setStermCode(String stermCode) {
        this.stermCode = stermCode;
    }
    
    public Date Entitlement.getCreateDate() {
        return this.createDate;
    }
    
    public void Entitlement.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Date Entitlement.getEffectiveDate() {
        return this.effectiveDate;
    }
    
    public void Entitlement.setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    
    public EntitlementBillingInfo Entitlement.getBillingInfo() {
        return this.billingInfo;
    }
    
    public void Entitlement.setBillingInfo(EntitlementBillingInfo billingInfo) {
        this.billingInfo = billingInfo;
    }
    
}
