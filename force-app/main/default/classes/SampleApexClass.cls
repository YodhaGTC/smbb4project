public class SampleApexClass {
    
    public string someVar = 'srikanth';
    public Integer i = 10;
    public Integer age;
    
    public SampleApexClass(){
        age = 0;
        system.debug('The AGE:'+age);
    }
    
    public SampleApexClass(Integer x){
        age = x;
        system.debug('The AGE:'+age);
    }
    
    public void display(){
        if(i > 5){
            system.debug('in if');
        }else if(i == 10){
            system.debug('in else if ');
        }
    }
    
    public void addition(integer a, integer b){
        //integer a  = 10;
        //integer b  = 20;
        if(a!=null && b!=null){
            integer c  = a  + b;
            system.debug('The result>> '+c);
        }
        
    }
    
    public integer doAddition(integer a, integer b){
        integer c = 0;
        if(a!=null && b!=null){
            c  = a  + b;
        }
        
        return c;
    }
    
}