public class ApexFundamentals {    
    
    
    public class wrapper{
        public string personName;
        public Integer personAge;
    }
    
    public wrapper display(){
        String name = 'srikanth';
        Integer age = 10;
       
        
        wrapper wrp = new wrapper();
        wrp.personName = name;
        wrp.personAge = age;
        
        return wrp;
    }
}