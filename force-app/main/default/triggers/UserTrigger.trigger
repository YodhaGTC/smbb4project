trigger UserTrigger on User (After Update) {
    if(Trigger.isAfter && Trigger.isUpdate){        
        UserTriggerHandler.doHandleAfterUpdate(Trigger.New, Trigger.NewMap, Trigger.old, Trigger.oldMap);
    }
}