package com.real.ums.entitlement;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/entitlements")
@Controller
@RooWebScaffold(path = "entitlements", formBackingObject = Entitlement.class)
@RooWebJson(jsonObject = Entitlement.class)
public class EntitlementController {
}
