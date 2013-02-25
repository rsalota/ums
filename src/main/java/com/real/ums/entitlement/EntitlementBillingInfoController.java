package com.real.ums.entitlement;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = EntitlementBillingInfo.class)
@Controller
@RequestMapping("/entitlementbillinginfoes")
public class EntitlementBillingInfoController {
}
