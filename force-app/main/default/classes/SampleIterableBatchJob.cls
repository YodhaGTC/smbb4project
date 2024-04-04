public class SampleIterableBatchJob implements Database.Batchable<sobject>{
    
    List<Contact> contactsList;
    public SampleIterableBatchJob(List<Contact> consList){
        contactsList = new List<Contact>();
        contactsList = consList;
    }
    
    public  Iterable<sObject> start(Database.BatchableContext bc) {
        
        return contactsList;
    }
    
    public void execute(Database.BatchableContext bc, List<Sobject> datalist){
        System.debug('EXECUTE The contacts list of size'+datalist.size());
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Finish Method');
    }
    
}