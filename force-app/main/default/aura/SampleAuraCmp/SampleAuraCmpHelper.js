({
	doShow: function(component){        
        console.log("--method to method communication--");    
        component.set("v.company", "Yodha GTC");
        this.anotherMethod(component);
    },
    
    anotherMethod : function(component){ 
    	console.log("--method to method communication--with in helper");    
    }
    
    
})