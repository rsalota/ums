// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.real.ums.entitlement;

import com.real.ums.entitlement.CancelEntitlement;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CancelEntitlement_Roo_Json {
    
    public String CancelEntitlement.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CancelEntitlement CancelEntitlement.fromJsonToCancelEntitlement(String json) {
        return new JSONDeserializer<CancelEntitlement>().use(null, CancelEntitlement.class).deserialize(json);
    }
    
    public static String CancelEntitlement.toJsonArray(Collection<CancelEntitlement> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CancelEntitlement> CancelEntitlement.fromJsonArrayToCancelEntitlements(String json) {
        return new JSONDeserializer<List<CancelEntitlement>>().use(null, ArrayList.class).use("values", CancelEntitlement.class).deserialize(json);
    }
    
}