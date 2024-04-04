({
    firechildcmpevent : function(component, event, helper) {
        var cmpEvent = component.getEvent("mycmpevent");
        cmpEvent.setParams({"message":"hello yodhaGTC this is msg fired from child by using cmp event"});
        cmpEvent.fire();
    }
})