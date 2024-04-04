@isTest
public class AccountTriggerTest {
    
    @isTest
    public static void doTest(){
        Account acnt = new Account();
        acnt.name = 'TEST Account';
        acnt.SMB_Cusotmer_Email__c = 'Test@user.com';
        acnt.AccountNumber = 'SFDC890';
        Test.startTest();
        insert acnt;
        Test.stopTest();
        //resutl check//
        List<Contact> consList = [select Id, LastName, AccountId From Contact];
        system.assertEquals(1, consList.size(), 'Contacts mismatched');
        List<Account> acntsList = [Select Id, Name, Total_no_of_Related_Contacts__c from account];
        system.assertEquals(1, acntsList.size(), 'Accounts mismatched');
        system.assertEquals(1, acntsList[0].Total_no_of_Related_Contacts__c, 'count of contacts on Accounts mismatched');
    }
    
}