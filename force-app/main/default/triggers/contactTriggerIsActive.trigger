trigger contactTriggerIsActive on Contact (after insert,after update) {
    if((trigger.isInsert || trigger.isUpdate) && trigger.isAfter){
        contactTriggerIsActiveHandler.checkMe(trigger.new);
    }
}
    
   /* Set<Id> accIdSet = new Set<Id>();
    List<Account> accList = new List<Account>();
    Map<Id,Contact> accountConmap = new Map<Id,Contact>();
    // get Account Id from Contact
    for(Contact con :trigger.new){
        accIdSet.add(con.AccountId);
    }
     // Query All Contacts Where Account Id is IN accIdSet And Is Active  == Ture
    for(Contact con : [select Id, Is_Active__c, AccountId  From Contact Where AccountId IN :accIdset AND Is_Active__c = true]){
        accountConmap.put(con.AccountId,con);
    }
    if(accountConmap.size()>0){
        for(Id accid :accountConmap.Keyset()){
            Account acunt = new Account (Id = accid,Is_Active__c = true);
            accList.add(acunt);
        }
    } 
    

    
    if(accList.size()>0){
        update accList;
    }*/