({
    invokeChildmethod : function(component, event, helper) {
        var childCmpVar = component.find("childCmpId");
        
        var p1 = 'hello, yodha this is paramone info msg';
        var p2 = 'hello, yodha this is paramtwo info msg';
        
        childCmpVar.childMsgMethod(p1,p2);
    }
})