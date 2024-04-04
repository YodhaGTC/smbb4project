public class SmartPhoneApexClass {
    
    public string modelName = 'Iphone 15S';
    
    public void getSpecifications(){
        system.debug('Model Name: '+modelName);
    }
    
    public void makeAcall(string phNumber){
        system.debug('I will make a call to :'+phNumber);
    }
    
    public void sendSMS(string phNumber, String msg){
        system.debug('I will send sms to :'+phNumber+ ' Msg: '+msg);
    }

}