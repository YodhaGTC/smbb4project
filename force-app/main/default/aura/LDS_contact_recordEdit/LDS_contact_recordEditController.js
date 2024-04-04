({
	saveRecordFunction : function(component, event, helper) {
		component.find("formId").get("e.recordSave").fire();
	}
})