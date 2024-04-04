({
    onload : function(component, event, helper) {
        console.log("--onlond function--");
        component.set("v.address", "HYD-MDH");
    },
    
    doSomething : function(component, event, helper){
        console.log("--onClick of user request function--");
        component.set("v.phone", "9091921999");
        helper.doShow(component);
    },
    
    getEmpidFunction : function (component, event, helper){
        console.log("--on click-1-");
        //to invoke apex class auraenabled method
        var action = component.get("c.getEmpidmethod");
        action.setCallback(this, function(resp){
            var data  = resp.getReturnValue();
            component.set("v.EmpId", data);
        });
        $A.enqueueAction(action);
    }
    
    
})