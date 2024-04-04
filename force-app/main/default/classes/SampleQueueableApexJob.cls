public class SampleQueueableApexJob implements Queueable {

    public void execute(QueueableContext qc){
        doHandler();
        doHandlerTwo();
        SampleApexBatchJob obj = new SampleApexBatchJob();
        Database.executeBatch(obj);
    }
    
    @future
    public static void doHandler(){
        
    }
    
    @future
    public static void doHandlerTwo(){
        
    }
    
}