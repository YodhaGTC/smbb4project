public class NormalApexTransaction {
    
    public void doGetData(){
        List<Contact> consList = [Select Id, LastName From Contact];
        SampleIterableBatchJob obj = new SampleIterableBatchJob(consList);
        Database.executeBatch(obj, 200);
    }
    
    
    public void doLoadDATA(){
        doHandler();
    }
    
    @future
    public static void doHandler(){
        doHandlerTwo();
    }
    
    @future
    public static void doHandlerTwo(){
        
    }

}