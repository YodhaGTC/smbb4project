public class ContactUpdateBatchJob implements Database.batchable<Sobject>{
    
    public database.querylocator start(Database.batchablecontext bc){
        String query = 'select id, lastname, phone from contact where phone=null';
        return database.getQuerylocator(query);
    }
    
    public void execute(Database.batchablecontext bc, List<sObject> datalist){
        List<contact> toCollectConslist = new List<contact>();
        List<Contact> consList = (List<Contact>)datalist;
        for(contact con: consList){
            con.phone = '9091921999';
            toCollectConslist.add(con);
        }
        if(!toCollectConslist.isEmpty()){
            update toCollectConslist;
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
        mailObj.setSubject('Apex Contact Job ' + a.Status);
        mailObj.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mailObj });
        
    }
}