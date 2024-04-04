public class SampleApexcls {
    
    public string personNameVar = 'Srikanth Bellamkonda';
    public string address;
    public string phone;
    public string company;
    
    public SampleApexcls(){
        address = 'Hyd';
    }
    
    public void doSomething(){
        phone = '890890890';
        doShow();
    }
    
    public void doShow(){
        company = 'Yodha GTC';
    }
    
    @auraEnabled
    public static string getEmpidmethod(){
        system.debug('in aura method');
        return '54866567';
    }
    
    

}