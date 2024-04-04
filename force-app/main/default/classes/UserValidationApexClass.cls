public class UserValidationApexClass {
    
    public string uName = 'srikanth@salesforce.com';
    public string pswd = 'Pass@123';
    
    
    public void doLoginCheck(String userName, String Password){
        
        if(userName == uName && Password == pswd){
            system.debug('SUCCESS:');
        }else {
            system.debug('ERROR:');
        }
        
    }

}