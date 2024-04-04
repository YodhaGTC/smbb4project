public class SampleApexBatchJob implements Database.Batchable<sobject>, database.stateful{
    
    public Integer count = 0;
    public database.querylocator start(database.batchablecontext bc){
        system.debug('********THE START ***********');
        string query = 'select id, lastname, phone from contact';
        return database.getQuerylocator(query);
    }
    
    public void execute(database.batchablecontext bc, List<Sobject> datalist){
        count = count + datalist.size();
        system.debug('********THE EXECUTE ******The count*****'+count);
    }
    
    public void finish(database.batchablecontext bc){
        system.debug('********THE FINISH *****The final count ******'+count);
    }
    
}