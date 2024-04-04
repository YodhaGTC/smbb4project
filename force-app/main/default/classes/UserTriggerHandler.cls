public class UserTriggerHandler {
    
    Public static void doHandleAfterUpdate(List<User> newUsersList, Map<Id, User> newusersMap ,List<User> oldUsersList, Map<Id, User> oldUsersMap){
        //Key = OA
        //value = srikanth
        //Map<OA, Srikanth>
        Map<Id, Id> userIdWithManagerIdmap = new Map<Id, Id>();
        for(User u: newUsersList){
            //deactive user
            if(u.isActive==false){
                userIdWithManagerIdmap.put(u.id, u.ManagerId);//put<OA, Srikanth>
            }
        }
        
        doOwnershipTransfer(userIdWithManagerIdmap);
        
    }
    
    @future
    public static void doOwnershipTransfer(Map<Id, Id> userIdWithManagerIdmap){
        List<Account> toUpdateAcntList = new List<Account>();
        //this soql brings deactived users related account records 
        List<Account> deactiveUserAccountsList = [Select Id, OwnerId 
                                                  FROM account 
                                                  WHERE ownerId IN: userIdWithManagerIdmap.keyset()]; // OA
        for(Account acnt: deactiveUserAccountsList){
            Id deactiveUserID = acnt.OwnerId; // OA
            Id managerID = userIdWithManagerIdmap.get(deactiveUserID);
            
            acnt.ownerId = managerID; // ownership transfer
            toUpdateAcntList.add(acnt); // collect updated accounts.
        }
        
        //check empty or not
        if(!toUpdateAcntList.isEmpty()){
            update toUpdateAcntList; // DML
        }
    }
}