public class SMBcouponCodeBatchJob implements Database.batchable<Sobject>{
    public database.querylocator start(Database.batchablecontext bc){
        String query = 'SELECT ID,Coupon_codeId__c FROM Coupon_code__c';
        return database.getQuerylocator(query);
    }
    public void execute(Database.batchablecontext bc, List<sObject> datalist){
        List<Coupon_code__c> cCodeList = (List<Coupon_code__c>)datalist;
        Map<String, Coupon_code__c> ccCodeMap = new Map<String, Coupon_code__c>();
        for(Coupon_code__c cc: cCodeList){
            ccCodeMap.put(cc.Coupon_codeId__c, cc);
        }
        
        List<Product2> prdList = [Select Id, Coupon_code__c, Coupon_codeId__c 
                                  From Product2
                                 Where Coupon_codeId__c IN: ccCodeMap.keyset()];
        List<product2> collectPrdsList = new List<product2>();
        for(Product2 prd : prdList){
            if(ccCodeMap.containskey(prd.Coupon_codeId__c)){
                prd.Coupon_code__c = ccCodeMap.get(prd.Coupon_codeId__c).id; // ref key
                collectPrdsList.add(prd);
            }            
        }
        if(!collectPrdsList.isEmpty()){
            update collectPrdsList;
        }
        
    }
    
    public void finish(Database.batchablecontext bc){ 
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob 
                          WHERE Id = :bc.getJobId()];        
        Messaging.SingleEmailMessage mailObj = new Messaging.SingleEmailMessage();
        List<string> toAddress = new List<String>();
        toAddress.add(a.CreatedBy.Email);
        toAddress.add('srikanth.mobbisys@gmail.com');
        mailObj.setToAddresses(toAddress);
        mailObj.setSubject('SMB coupon Code BatchJob ' + a.Status);
        mailObj.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mailObj }); 
    }
}