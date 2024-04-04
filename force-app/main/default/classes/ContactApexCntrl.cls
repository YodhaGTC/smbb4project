public class ContactApexCntrl {
    
    //method: 
    public void doCreateContact(){        
        Contact con = new Contact();
        con.LastName = 'Test Apex Contact 3';
        con.MailingPostalCode = '789789';        
        system.debug('Before insert>> '+con);        
        insert con;
        system.debug('After insert>> '+con);
    }
    
    public void doCreateContact(String lName, String fName, String phone, Date birthDate){
        if(lName!=null && fName!=null && phone!=null && birthDate!=null){
            Contact con = new Contact();
            con.LastName = lName;
            con.FirstName = fName;
            con.Phone = phone;
            con.Birthdate = birthDate;
            con.MailingPostalCode = '789789';
            insert con;
        }
    }
    
    public void doCreateOppty(){
        Opportunity opp = new Opportunity();
        opp.Name = 'TEST SMB ORDER 567';
        opp.CloseDate =  system.today();
        opp.StageName = 'Prospecting';
        
        insert opp;
        
        
    }
    
    public void doGetSingleContact(){
       Contact contactRecordVar = [SELECT Id, LastName, AccountId, Phone, Email, Birthdate FROM Contact Limit 1];
    }
    
    public void doGetSpecificRecord(){
        Contact contactRecordVar = [SELECT Id, LastName, FirstName, AccountId, Phone, Email, Birthdate 
                                    FROM Contact 
                                    WHERE NAME = 'bellamkonda testlname'
                                    ];
        system.debug('get contact record>>>> '+contactRecordVar);
    }
    
    public void doGetSpecificRecord(String searchKeyinput){
        Contact contactRecordVar = [SELECT Id, LastName, FirstName, AccountId, Phone, Email, Birthdate 
                                    FROM Contact 
                                    WHERE NAME = :searchKeyinput
                                    ];
        system.debug('get contact record>>>> '+contactRecordVar);
    }
    
    public void doUpdateContact(){
        Contact con = [SELECT Id, LastName, FirstName, AccountId, Phone, Email, Birthdate 
                                    FROM Contact 
                                    WHERE NAME = 'bellamkonda testlname'
                                    ];
        
        
		con.Email = 'TESt@update.com';
		update con;
        
    }
    
    public void doDeleteContact(){
        Contact con = [SELECT Id    FROM Contact 
                                    WHERE NAME = 'bellamkonda testlname'
                                    ];
        
        delete con;
		
        
    }
    
}