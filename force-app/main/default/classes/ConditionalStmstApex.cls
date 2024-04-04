public class ConditionalStmstApex {

    public string name = 'srikanth';
    public string phNumber;
    
    public ConditionalStmstApex(string phone){
        phNumber = phone;
       system.debug('hello bossu AM constructor....!'); 
    }
    
    public void doSomething(){
        system.debug('hello bossu AM Method....!'+phNumber); 
    }
}