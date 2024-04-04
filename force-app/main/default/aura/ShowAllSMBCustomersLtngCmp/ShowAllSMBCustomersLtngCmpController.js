({
    showDATAfunction : function(component, event, helper) {
        
        //table columns
        component.set('v.mycolumns', [
            {label: 'SMB Customer Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'}            
        ]);
        
        
        
        
        var action  = component.get("c.getAllSMBcustomers"); //get visible of auraenabled apex class method
        console.log('1111:: ');
        //handling the return result from apex cls method.
        action.setCallback(this, function(resp){
            var status  = resp.getState(); // will get status here
            console.log('STATUS:: '+status);
            if(status === 'SUCCESS'){ // checking status is success or not
                var data  = resp.getReturnValue();  // will get return value (list of accounts)
                console.log('DATA:: '+JSON.stringify(data) );
                component.set("v.mydata", data); // rows data
                component.set("v.toShowTable", true);
            }
        });
        $A.enqueueAction(action); // to make apex server call
    }
})