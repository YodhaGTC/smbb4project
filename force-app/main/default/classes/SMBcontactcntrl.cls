public class SMBcontactcntrl {
    
    public class resultWrapper{
        @auraEnabled
        public string msg {get;set;}
        @auraEnabled
        public string conrecordId {get;set;}
    }
    
    
    @auraEnabled
    public static resultWrapper doCreateContact(Contact conObj){
        resultWrapper wrp = new resultWrapper();
        try{
            //conObj.AccountId = 
            insert conObj;
            wrp.msg = 'Contact inserted : ';
            wrp.conrecordId = conObj.id;
        }catch(Exception ex){
            wrp.msg = 'ERROR: '+ex.getMessage();
            wrp.conrecordId = null;
        }        
        return wrp;
    }
    
}