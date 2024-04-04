({
    captureInputsforSearch : function(component, event, helper) {
        var inputcmp = component.find("searchkeyinputId");
        var typedValue = inputcmp.get("v.value");
        console.log('--1---'+typedValue);        
        var action  = component.get("c.getSearchCustomer");
        action.setParams({'seacrchKey': typedValue});
        action.setCallback(this,  function(resp){
            var status  = resp.getState(); 
            if(status === 'SUCCESS'){
                var data  = resp.getReturnValue();
                 component.set("v.data", resp.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    onLoad: function(component, event, helper){
        component.set('v.columns', [
            {label: 'SMB Customer Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ]);
        
        var action = component.get("c.getAllSMBcustomers");
        action.setCallback(this, function(resp){
            var status  = resp.getState();
            if(status === 'SUCCESS'){
                component.set("v.data", resp.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})