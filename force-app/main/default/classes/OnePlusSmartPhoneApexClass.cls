public class OnePlusSmartPhoneApexClass {
    
    String modelNameVar	= 'OnePlus 12R';
    Integer batteryPowerRatingVar = 5500;
    String operatingSystemVar = 'OxygenOS';
    String ramVar = '8 GB';
    Decimal priceVar = 39999.99;
    String manufacturerVar = 'OnePlus';
    String colourVar = 'Iron Gray';
    String productDimensionsVar = '‎16.3 x 7.5 x 0.9 cm, 207 g';
    String specialfeaturesVar = '‎Dual SIM';
    String memoryCapacityVar = '128 GB';
    
    public void aboutPhoneMtd(){
        system.debug('Model Name: '+modelNameVar);
        system.debug('Battery Power Rating: '+batteryPowerRatingVar);
        system.debug('operating System: '+operatingSystemVar);
        system.debug('Ram: '+ramVar);
        system.debug('Price : '+priceVar);
        system.debug('Manufacturer: '+manufacturerVar);
        system.debug('Colour: '+colourVar);
        system.debug('Product Dimensions: '+productDimensionsVar);
        system.debug('Special features: '+specialfeaturesVar);
        system.debug('Memory Capacity: '+memoryCapacityVar);
    }
    
    public void phoneCallMtd(){
        system.debug('I will make a phone calls');
    }
    
    
}