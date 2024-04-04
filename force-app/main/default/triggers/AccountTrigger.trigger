trigger AccountTrigger on Account (After insert, After update) {
   
    if(Trigger.isAfter && Trigger.isInsert){
        List<contact> toInsertConsList = new List<Contact>();
        for(Account acnt: Trigger.New){
            contact con = new contact();
            con.LastName = acnt.Name;
            con.AccountId = acnt.id;
            con.MailingPostalCode = '789789';
            toInsertConsList.add(con);
        }
        
        if(!toInsertConsList.isEmpty()){
            insert toInsertConsList;
        }
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        set<Id> accountIdset = new set<Id>();
        for(Account newAccount: Trigger.New){             
            //it hold old version of account
            Account oldAccount = Trigger.oldMap.get(newAccount.id);
            //isChanged
            if(newAccount.SMB_Customer_Status__c != oldAccount.SMB_Customer_Status__c && 
               newAccount.SMB_Customer_Status__c == 'No Relation'){
                accountIdset.add(newAccount.id);
            }
        }
        
        List<case> toUpdateCasesList = new List<Case>();
        List<Case> openCasesList = [Select Id, Status From Case Where AccountId IN: accountIdset AND Status != 'Closed' ];
        for(case cs: openCasesList){
            cs.status = 'Closed';
            toUpdateCasesList.add(cs);
        }
        if(!toUpdateCasesList.isEmpty()){
            update toUpdateCasesList;
        }
        
    }
    

}