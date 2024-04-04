public class RelatedApexClass {
    
    //integer i = 10, 20;
    
    public Account acnt;    
    /*public RelatedApexClass(string nameInput){
        acnt = new Account();
        acnt = [Select Id, Name, Phone From Account Where Name = : nameInput];
    }*/   
    public void doCreateRecord(){
        Account acnt = new Account();
        acnt.Name = 'TEST Apex Account Business';
        acnt.Phone = '8908908909';
        acnt.AccountNumber = 'SFDC8906';
        acnt.SMB_Cusotmer_Email__c = 'business@acnt.com.dev1';
        insert acnt;
        
        Contact con = new contact();
        con.LastName = 'TEST contact';
        con.MailingPostalCode = '890890';
        con.AccountId = acnt.id;
        insert con;
        
    }    
    public void doCreateSobjectRecord(String nameInput){
        if(nameInput!=null){
            Account acnt =  [Select Id From Account Where Name= :nameInput];
            if(acnt!=null){
                Contact con = new contact();
                con.LastName = 'TEST contact';
                con.MailingPostalCode = '890890';
                con.AccountId = acnt.id;
                insert con;
            }
        }
        
    }    
    public void doCreateContactRec(){
        Contact con = new contact();
        con.LastName = 'TEST contact20';
        con.MailingPostalCode = '890890';
        con.AccountId = acnt.id;
        insert con;
    }
    //------------------------------//
    
    public void doLoops(){
        //do while loop
        //while loop
        //for loop
        //--------//
        
        /* Integer i  = 0;
do {
system.debug('The i Value: '+i);
i++;
}while(i < 10);

Integer i  = 0;
while(i < 10){
system.debug('The i Value: '+i);
i++;
}

for(Integer i  = 0; i < 10; i++){
system.debug('The i Value: '+i);
}*/
    }
    
    public void doCreatemultiplecontacts(){
       /* for(Integer i  = 0; i < 165; i++){
            Contact con = new contact();
            con.LastName = 'TEST contact_'+i;
            con.MailingPostalCode = '890890';
            con.AccountId = acnt.id;
            insert con;
        }
        
        for(Integer i  = 0; i < 165; i++){
            Account acntX = [Select Id, Name, Phone From Account LIMIt 1];
        }*/
    }
    
    public void show(){
        //Account acntrec = [Select Id, Name From Account];
        for(Integer i =0; i < 160; i++){
            contact con = new contact();
            con.LastName = 'TEST';
            con.MailingPostalCode = '890809';
            insert con;
        }
    }
    
    
    
}