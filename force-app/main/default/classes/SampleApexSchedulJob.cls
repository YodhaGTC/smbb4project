public class SampleApexSchedulJob implements Schedulable{
    
    
    public void execute(SchedulableContext sc){
        contact con  = new contact();
        con.LastName = 'TEST cnt by schedulablejob';
        con.MailingPostalCode = '890890';
        insert con;
    }
}