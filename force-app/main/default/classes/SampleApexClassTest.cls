@isTest
public class SampleApexClassTest {

    @isTest
    public static void doTest(){
        SampleApexClass obj = new SampleApexClass();
        SampleApexClass obj2 = new SampleApexClass(10);
        obj2.display();
        obj2.addition(10,10);
        integer actualResult  = obj2.doAddition(10,10);
        integer expectedResult = 20;
        system.assertEquals(expectedResult, actualResult, 'ERROR: result mismatched');
    }
}