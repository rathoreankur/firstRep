// Whenever the user insert ,update,delete,undelete the contacts record associated with 
//account object then in that case the Account should be Updated a field called 'No of Contact';
trigger CountNoofContactsTrigger on Contact (after insert,after update,after delete,after Undelete) {
    Set<Id> accountIds = new Set<Id>();
    Set<Id> AccountIdSetOld = new Set<Id>();
    List<Account> acclistToUpdate = new List<Account>();
    Map<Id,List<Contact>> MapOfActIdandConList = new Map<Id,List<Contact>>();
    if(trigger.isInsert || trigger.isUndelete || trigger.isUpdate){
        for(Contact con : trigger.new){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
        if(!accountIds.isEmpty()){
            //List<Contact> conList = [Select Id, LastName, AccountId From Contact Where AccountId IN:accountIds];
            for(Contact ct : [Select Id, LastName, AccountId From Contact Where AccountId IN:accountIds]){
                if(MapOfActIdandConList.containsKey(ct.AccountId))
                {
                    MapOfActIdandConList.get(ct.AccountId).add(ct);
                }
                else
                {
                    MapOfActIdandConList.put(ct.AccountId, new List<Contact> {ct});
                }
            }
            
        }
    }

    if(trigger.isDelete){
        for(Contact contOld : trigger.Old){
            if(contOld.AccountId != null){
                AccountIdSetOld.add(contOld.AccountId);
            }
        }
        if(AccountIdSetOld.size()>0){
            List<Contact> lstContOld = [Select Id,AccountId from Contact where AccountId in: AccountIdSetOld ];
            for(Contact ct : lstContOld)
            {
                if(MapOfActIdandConList.containsKey(ct.AccountId))
                {
                    MapOfActIdandConList.get(ct.AccountId).add(ct);
                }
                else
                {
                    MapOfActIdandConList.put(ct.AccountId, new List<Contact> {ct});
                }
            }
        }
    }
    for( Id actId : MapOfActIdandConList.keySet()){
        Account act = new Account();
        act.Id = actId;
        act.No_of_Contacts__c = MapOfActIdandConList.get(actId).size();
        acclistToUpdate.add(act);
    }
    if(acclistToUpdate.size()>0){
        update acclistToUpdate;
    }
}