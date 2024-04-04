public class LenovoApexClass {    
    public string brandVar = 'Lenovo';
    public string modelNameVar = 'IdeaPad 3 15ITL6';
    public string screenSizeVar = 	'15.6 Inches';
    public date manufactureDateVar = System.today();
    public dateTime mfdtVar = system.now();
    public string harddiskcapacityVar = '250GB';    
    public void sepcifications(){
        system.debug('************SPECIFICATIONS**************');
        system.debug('Brand: '+brandVar);
        system.debug('Model Name: '+modelNameVar);
        system.debug('Screen Size: '+screenSizeVar);
        system.debug('Manufacture: '+manufactureDateVar);
        system.debug('Manufacture DateTime ZONE: '+mfdtVar);
        system.debug('Hard Disk Capacity: '+harddiskcapacityVar);
        system.debug('************END**************');        
    }
    public void storage(){
        system.debug('I can store up to: '+harddiskcapacityVar);
    }
}