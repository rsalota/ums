package com.real.ums.entitlement;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/entitlements")
@Controller
@RooWebScaffold(path = "entitlements", formBackingObject = Entitlement.class)
@RooWebJson(jsonObject = Entitlement.class)
public class EntitlementController {
	private static Logger log = Logger.getLogger(EntitlementController.class);

	@RequestMapping(value = "/entitlementkey/cancel/{entitlementKey}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> cancel(
			@PathVariable("entitlementKey") String entitlementKey,
			@RequestBody String json) {
		log.info("Cancel the entitlement" + entitlementKey + " " + json);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		validateEntitlementKey(entitlementKey);
		List<Entitlement> entitlements = checkEntitlementKey(entitlementKey);
		if (entitlements != null && entitlements.size() == 1) {
			Entitlement entitlement = entitlements.get(0);
			CancelEntitlement cancelEntitlement = CancelEntitlement
					.fromJsonToCancelEntitlement(json);
			if (cancelEntitlement == null
					|| cancelEntitlement.getCancelReason() == null
					|| cancelEntitlement.getStatus() == null) {
				throw new IllegalArgumentException(
						"Cannot have cancel reason or status as null"
								+ cancelEntitlement.toString());
			}

			log.info("Cancel the entitlement" + entitlementKey + " "
					+ cancelEntitlement.getCancelReason());
			entitlement.setCancelReason(CancelReason.valueOf(cancelEntitlement
					.getCancelReason()));
			entitlement
					.setStatus(Status.valueOf(cancelEntitlement.getStatus()));
			entitlement.merge();
			return new ResponseEntity<String>(headers, HttpStatus.OK);
		}
		return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
	}

	private void validateEntitlementKey(String entitlementKey) {
		if (entitlementKey == null || entitlementKey.isEmpty()) {
			throw new IllegalArgumentException(
					"Entitlement key cannot be empty or NULL");
		}
	}

	@RequestMapping(value = "/entitlementkey/{entitlementKey}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> updateByEntitlementKey(
			@PathVariable("entitlementKey") String entitlementKey,
			@RequestBody String json) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		List<Entitlement> entitlements = checkEntitlementKey(entitlementKey);
		
		if (entitlements.size() == 1) {
			return new ResponseEntity<String>(headers, HttpStatus.OK);
		}

		if (entitlements.size() == 0) {
			Entitlement entitlement = Entitlement.fromJsonToEntitlement(json);
			if (entitlement.merge() == null) {
				return new ResponseEntity<String>(headers, HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<String>(headers, HttpStatus.OK);
		}
		
		return new ResponseEntity<String>(headers, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/entitlementkey/{entitlementKey}", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ResponseEntity<String> findByEntitlementKey(
			@PathVariable("entitlementKey") String entitlementKey) {
		log.info("Entitlement key requested " + entitlementKey);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		if (entitlementKey == null || entitlementKey.isEmpty()){
			log.info("Entitlement key is not present return bad request");
			return new ResponseEntity<String>(headers,HttpStatus.BAD_REQUEST);
		}
		
		List<Entitlement> entitlements = checkEntitlementKey(entitlementKey);
		if (entitlements != null && entitlements.size() == 1) {
			return new ResponseEntity<String>(Entitlement.toJsonArray(entitlements),headers,HttpStatus.OK);
		}else if (entitlements !=null && entitlements.size() > 1){
			return new ResponseEntity<String>(headers,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<String>(headers,HttpStatus.NOT_FOUND);
	}

	private List<Entitlement> checkEntitlementKey(String entitlementKey) {
		List<Entitlement> entitlements = Entitlement
				.findEntitlementsByEntitlementKeyEquals(entitlementKey)
				.getResultList();
		return entitlements;
	}

}
