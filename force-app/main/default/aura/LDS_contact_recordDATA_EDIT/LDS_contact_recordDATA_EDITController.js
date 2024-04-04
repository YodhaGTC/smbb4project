({
    saveRecordFunction : function(component, event, helper) {
        //component.find("objformId").saveRecord();
        component.find("objformId").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state === 'SUCCESS'){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The record has been updated successfully.",
                    "type":"success"
                });
                toastEvent.fire();
            }
        }));
    }
})