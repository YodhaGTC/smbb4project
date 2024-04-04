public class MiltonWaterBottelApexClass {
    
    //properties // Variables   
    public String bottelName = 'Milton Aura'; 
    public String bodyTypeVar = 'Steel';
    public String bottelTypeVar = 'Flask';
    public string capacityVar = '1 ltr';
    public integer packOfVar = 1;
    public decimal price = 90.99;
    public date manufactureDate = System.today();
    
    public void storage(){
        system.debug('Milton Aura Storage capacity: '+capacityVar);
    }
    
    public void specifications(){
        system.debug('****************START*****************');
        system.debug('Name: '+bottelName);
        system.debug('Capacity: '+capacityVar);
        system.debug('Body Type: '+bodyTypeVar);
        system.debug('Bottel Type: '+bottelTypeVar);
        system.debug('Pack of: '+packOfVar);
        system.debug('price : '+price);
        
        system.debug('****************END*****************');
    }
    
    
    
}