({
	handlecustevent : function(component, event, helper) {
		var msg = event.getParam("message");
        component.set("v.receiverVar", msg);
	}
})