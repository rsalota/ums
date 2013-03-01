// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.real.ums.entitlement;

import com.real.ums.entitlement.CancelReason;
import com.real.ums.entitlement.Entitlement;
import com.real.ums.entitlement.EntitlementController;
import com.real.ums.entitlement.Status;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EntitlementController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EntitlementController.create(@Valid Entitlement entitlement, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, entitlement);
            return "entitlements/create";
        }
        uiModel.asMap().clear();
        entitlement.persist();
        return "redirect:/entitlements/" + encodeUrlPathSegment(entitlement.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EntitlementController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Entitlement());
        return "entitlements/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EntitlementController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("entitlement", Entitlement.findEntitlement(id));
        uiModel.addAttribute("itemId", id);
        return "entitlements/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EntitlementController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("entitlements", Entitlement.findEntitlementEntries(firstResult, sizeNo));
            float nrOfPages = (float) Entitlement.countEntitlements() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("entitlements", Entitlement.findAllEntitlements());
        }
        addDateTimeFormatPatterns(uiModel);
        return "entitlements/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EntitlementController.update(@Valid Entitlement entitlement, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, entitlement);
            return "entitlements/update";
        }
        uiModel.asMap().clear();
        entitlement.merge();
        return "redirect:/entitlements/" + encodeUrlPathSegment(entitlement.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EntitlementController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Entitlement.findEntitlement(id));
        return "entitlements/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EntitlementController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Entitlement entitlement = Entitlement.findEntitlement(id);
        entitlement.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/entitlements";
    }
    
    void EntitlementController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("entitlement_createdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("entitlement_effectivedate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("entitlement_enddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void EntitlementController.populateEditForm(Model uiModel, Entitlement entitlement) {
        uiModel.addAttribute("entitlement", entitlement);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cancelreasons", Arrays.asList(CancelReason.values()));
        uiModel.addAttribute("statuses", Arrays.asList(Status.values()));
    }
    
    String EntitlementController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
