({
	fireEventaction : function(component, event, helper) {
        var appEvent = $A.get("e.c:yodhaapplicationevent");
        appEvent.setParams({'message':'this is msg from cmp1 publised '});
        appEvent.fire();
	}
})