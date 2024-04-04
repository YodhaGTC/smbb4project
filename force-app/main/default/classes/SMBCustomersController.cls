public class SMBCustomersController {

    @auraEnabled
    public static List<Account> getAllSMBcustomers(){
        return [Select Id, Name, Phone, Industry, Rating From Account];
    }
    
    @auraEnabled
    public static List<Account> getSearchCustomer(String seacrchKey){
        String key = '%'+seacrchKey+'%';        
        return [Select Id, Name, Phone, Industry, Rating From Account Where Name LIKE:key];
    }
    
}