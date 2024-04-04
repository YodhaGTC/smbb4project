@isTest
public class SampleApexBatchJobTest {
    
    @isTest
    public static void doTest(){
        List<Contact> consList = new List<Contact>();
        for(Integer i =0; i < 100; i++){
            contact con = new contact();
            con.LastName = 'TEST_'+i;
            con.MailingPostalCode = '909090';
            consList.add(con);
        }
        Test.startTest();
        insert consList;
        SampleApexBatchJob obj = new SampleApexBatchJob();
        Database.executeBatch(obj);
        Test.stopTest();
    }
}