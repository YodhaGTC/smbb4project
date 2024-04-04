public class ChildApexClass extends ParentApexClass{

    public void childClsmtd(){
        system.debug('the info: '+personName);
    }
    
    public override  void parentshow(){
        system.debug('a method inside child class');
        super.parentshow();
    }
}