public class SomeApexClass {

    public string personName = 'RAMA RAO';
    public integer age;
    public string address;
    
    public SomeApexClass(){
        age = 20;
        address = 'hyd';
        
        system.debug('personName: '+ personName);
        system.debug('age: '+ age);
        system.debug('address: '+ address);
    }
    
    public SomeApexClass(Integer inputAge, String inputAddress){
        age = inputAge;
        address = inputAddress;
        
        system.debug('personName: '+ personName);
        system.debug('age: '+ age);
        system.debug('address: '+ address);
    }
    
    
}