// When User Change the Phone No On Conact Object Then the Same Phone
// Should Be Update to Parent Account Record.
trigger AccountPhoneUpdateTrigger on Contact (after Update) {
    Map<Id,String> accIdPhoneMap = new Map<Id,String>();
    List<Account> acclistToUpdate = new List<Account>();
    if(trigger.isAfter){
        if(trigger.isUpdate){
            for(Contact con : trigger.new){
                if(trigger.oldMap.get(con.Id).Phone != con.Phone){
                    accIdPhoneMap.put(con.AccountId, con.Phone);
                }
            }
            List<Account> accList = [Select Id, Name, Phone From Account Where Id IN:accIdPhoneMap.keySet()];
            if(accList.size()>0){
                for(Account acc : accList){
                    if(accIdPhoneMap.containsKey(acc.Id)){
                        acc.Phone = accIdPhoneMap.get(acc.id);
                    }
                    acclistToUpdate.add(acc);
                }
            }
            update acclistToUpdate;
        }
    }

}