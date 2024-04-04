({
	saveAction : function(component, event, helper) {
		var action = component.get("c.doCreateContact");
        var conInputsVar = component.get("v.con");
        action.setParams({'conObj':conInputsVar});
        action.setCallback(this,function(resp){
            var status  = resp.getState();
            if(status === 'SUCCESS'){
                var data  = resp.getReturnValue();
                console.log(JSON.stringify(data));
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": data.msg,
                    "type":"success"
                });
                toastEvent.fire();
                
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": data.conrecordId,
                    "slideDevName": "detail"
                });
                navEvt.fire();
            }
        });
        $A.enqueueAction(action);
	}
})