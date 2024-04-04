({
	getMessageAction : function(component, event, helper) {
		var params = event.getParam('arguments');
        if(params){
            component.set("v.childparamreceiverOne", params.paramOne);
            component.set("v.childparamreceiverTwo", params.paramTwo);
        }
	}
})