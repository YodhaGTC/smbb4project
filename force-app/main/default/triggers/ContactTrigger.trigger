trigger ContactTrigger on Contact (After insert, After Delete, After Undelete, After update) {
    
    ContactTriggerHandler handler  = new ContactTriggerHandler();
    
    
    if(Trigger.isAfter && Trigger.isInsert){
        handler.doCountofRelatedContacts(Trigger.New);
        handler.doSumofSalaryonContacts(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        handler.doCountofRelatedContacts(Trigger.Old);
        handler.doSumofSalaryonContacts(Trigger.Old);
    }
    
    if(Trigger.isAfter && Trigger.isUnDelete){
        handler.doCountofRelatedContacts(Trigger.New);
        handler.doSumofSalaryonContacts(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        //handler.doCountofRelatedContacts(Trigger.New); 
        //handler.doSumofSalaryonContacts(Trigger.New);
        handler.doSumofSalaryonContactsForUpdate(Trigger.New, Trigger.oldMap);
    }
    
}