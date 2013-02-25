// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.real.ums.entitlement;

import com.real.ums.entitlement.ApplicationConversionServiceFactoryBean;
import com.real.ums.entitlement.Entitlement;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Entitlement, String> ApplicationConversionServiceFactoryBean.getEntitlementToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.real.ums.entitlement.Entitlement, java.lang.String>() {
            public String convert(Entitlement entitlement) {
                return new StringBuilder().append(entitlement.getServiceId()).append(' ').append(entitlement.getEntitlementKey()).append(' ').append(entitlement.getUserGuid()).append(' ').append(entitlement.getStermCode()).toString();
            }
        };
    }
    
    public Converter<Long, Entitlement> ApplicationConversionServiceFactoryBean.getIdToEntitlementConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.real.ums.entitlement.Entitlement>() {
            public com.real.ums.entitlement.Entitlement convert(java.lang.Long id) {
                return Entitlement.findEntitlement(id);
            }
        };
    }
    
    public Converter<String, Entitlement> ApplicationConversionServiceFactoryBean.getStringToEntitlementConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.real.ums.entitlement.Entitlement>() {
            public com.real.ums.entitlement.Entitlement convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Entitlement.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getEntitlementToStringConverter());
        registry.addConverter(getIdToEntitlementConverter());
        registry.addConverter(getStringToEntitlementConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
