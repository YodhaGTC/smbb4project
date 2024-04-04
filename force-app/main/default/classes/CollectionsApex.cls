public class CollectionsApex {
    
    public void show(){
        
        Integer iVar = 10;
        system.debug('The i value: '+iVar);
        //10,40,45,30,5,40,3
        
        List<Integer> ivarlist = new List<Integer>();
        ivarlist.add(10);
        ivarlist.add(40);
        ivarlist.add(45);
        ivarlist.add(30);
        ivarlist.add(5);
        ivarlist.add(40);
        ivarlist.add(3);
        system.debug('The list values: '+ivarlist);
        
        SET<Integer> ivarSet = new SET<Integer>();
        ivarSet.add(10);
        ivarSet.add(40);
        ivarSet.add(45);
        ivarSet.add(30);
        ivarSet.add(5);
        ivarSet.add(40);
        ivarSet.add(3);
        system.debug('The SET values: '+ivarSet);
        
    }    
    public void showTwo(){
        //Account acnt = [Select Id, Name From Account];
        //List<Account> acntList = [Select Id, Name From Account];
        //system.debug('size of list: '+acntList.size());
        //Account acnt2 = [Select Id, Name From Account Where Name = 'asdfasdfasdfasdf'];
        //List<Account> acnt2 = [Select Id, Name From Account Where Name = 'asdfasdfasdfasdf'];
        //Set<Account> acntSet = [Select Id, Name From Account];
    }    
    public void showThree(){
        
        //contact con = new contact();
        List<Contact> consList = New List<Contact>();
        
        for(Integer i =0; i < 160; i++){
            contact con = new contact();
            con.LastName = 'TEST__'+i;
            con.MailingPostalCode = '890809';
            consList.add(con);
        }
        
        insert consList;
        system.debug('the size of list of contacts: '+consList.size());
         
/*Set<Contact> consSet = New Set<Contact>();

for(Integer i =0; i < 160; i++){
contact con = new contact();
con.LastName = 'TEST__'+i;
con.MailingPostalCode = '890809';
consSet.add(con);
}

insert consSet;*/
        
    }    
    public void getAllaccounts(){
        //get all accounts records and print each and every account name.
        
        List<Account> acntList = [Select Id, Name From Account];
        for(Account a :acntList){
            system.debug('The Account: '+a.Name);
        }
        
    }    
    public void getAllSMBAccounts(){
        
        List<Account> acntList = [Select Id From Account Where Name = 'TEST Apex Account Business'];
        
        if(!acntList.isEmpty()){
            List<Contact> toInsertConsList = new List<Contact>();
            for(Integer i =0; i < 10; i++){
                contact con = new contact();
                con.LastName = 'TSTEETE_'+i;
                con.MailingPostalCode = '789789';
                con.AccountId = acntList[0].id;
                toInsertConsList.add(con);
            }
            
            if(!toInsertConsList.isEmpty()){
                insert toInsertConsList;
            }
        }
        
        
        
        
        
    }    
    public void updateTodayContacts(){
        List<Contact> consList = [SELECT Id, Phone From Contact Where createddate = today];
        if(!consList.isEmpty()){
            List<contact> toUpdateconsList = new List<Contact>();
            for(Contact con: consList){
                con.phone = '(650) 867-0000';
                toUpdateconsList.add(con);            
            }
            if(!toupdateconsList.isEmpty()){
                update toUpdateconsList;
            }          
        }
    }
    public void toDeleteContacts(){
        List<contact> toDeleteconsList = [Select Id From Contact Where createdDate = today];
        if(!toDeleteconsList.isEmpty()){
            delete toDeleteconsList;
        }
    }
    public void toGetAssociatedAccounts(){
        List<Contact> conList = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId != null];
        //List<Id> accountIdsList = new List<Id>();
        Set<Id> accountIdsSet = new Set<Id>();
        
        for(Contact c: conList){
            //accountIdsList.add(c.AccountId);
            accountIdsSet.add(c.AccountId);
        }
        //system.debug('Size of LIST:'+accountIdsList.size());
        system.debug('Size of SET:'+accountIdsSet.size());
        
        List<Account> acntList =  [Select Id, Name, Phone, Rating, Industry From Account Where Id IN: accountIdsSet];
        system.debug('Size of acnts List:'+acntList.size());
        for(Account acnt: acntList){
            system.debug(acnt);
        }
        
        
        
        
        
        
        
        
        
    }
    
}