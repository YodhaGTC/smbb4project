@isTest
public class SmartPhoneApexClassTest {

    @isTest
    public static void doTest(){
        SmartPhoneApexClass obj = new SmartPhoneApexClass();
        obj.getSpecifications();
        obj.makeAcall('9091921999');
        obj.sendSMS('9091921999', 'TEST exectuions');
    }
}