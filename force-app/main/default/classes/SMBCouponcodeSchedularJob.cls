public class SMBCouponcodeSchedularJob implements Schedulable {
    
    public void execute(SchedulableContext  sc){
        SMBcouponCodeBatchJob job = new SMBcouponCodeBatchJob();
        Database.executeBatch(job);
    }

}