public class ContactTriggerHandler {
    
    public void doCountofRelatedContacts(List<Contact> consList){
        set<Id> setOfaccountIds = new set<Id>();
        for(Contact con: consList){
            if(con.AccountId!=null){
                setOfaccountIds.add(con.AccountId);
            }
        }
        
        List<Account> acntList = [Select Id, Total_no_of_Related_Contacts__c, (select Id from contacts)
                                  From Account 
                                  Where ID IN: setOfaccountIds];
        List<Account> toUpdateAcntList = new List<Account>();
        for(Account acnt: acntList){
            acnt.Total_no_of_Related_Contacts__c = acnt.contacts.size();
            toUpdateAcntList.add(acnt);
        }
        if(!toUpdateAcntList.isEmpty()){
            update toUpdateAcntList;
        }
    }
    
    public void doSumofSalaryonContacts(List<Contact> consList){
        set<Id> setOfaccountIds  = new set<Id>();
        for(Contact con: consList){
            if(con.AccountId!=null){
                setOfaccountIds.add(con.AccountId);
            }
        }
         salarycountUtility(setOfAccountIds);
    }
    
    
    public void doSumofSalaryonContactsForUpdate(List<Contact> consList, Map<Id, Contact> consMap){
        set<Id> setOfAccountIds = new set<Id>();
        for(Contact newCon: consList){
            if(newCon.AccountId!=null){
                Contact oldCon = consMap.get(newCon.id);
                if(newCon.AccountId!=oldCon.AccountId){
                    setOfAccountIds.add(newCon.AccountId);
                    setOfAccountIds.add(oldCon.AccountId);
                }
            }
        }
        
        salarycountUtility(setOfAccountIds);
        
    }
    
    public void salarycountUtility(set<Id> setOfAccountIds){
        List<Account> listofAcntsforUpdate = new List<Account>();// collection variable to collect all the updated accounts.
        List<AggregateResult> arList=  [select sum(Salary__c)amt, accountId from contact WHERE AccountID IN: setOfaccountIds Group By AccountId];// it is an aggregate query to bring sum of salarys of contact that are associated with account.
        for(AggregateResult ar : arList){// for each loop iterates aggregateresults data
            Decimal totalSumofSalary = (Decimal)ar.get('amt'); // get total salary from arlist, and assign to decimal var
            //to update account with total salary, for update we need accountId//
            Account acnt = new Account(); // account obj permission           
            acnt.id = (id)ar.get('accountId'); // get accountId from arlist, and assign to acnt recordid
            acnt.Total_Salary__c = totalSumofSalary; // populating total sum of salary value to total_salary__c 
            listofAcntsforUpdate.add(acnt); // collecting all account records
        }
        
        if(!listofAcntsforUpdate.isEmpty()){
            update listofAcntsforUpdate;
        }
    }

}