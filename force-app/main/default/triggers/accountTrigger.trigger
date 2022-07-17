trigger accountTrigger on Account (after insert,after update) {
    List<Account> accList = new List<Account>();
    Set<Id> accIdSet = new Set<Id>();
    
    if(trigger.isafter && trigger.isinsert){
        PositionHandler.populateposition(trigger.new);
    }
        /*if(!PositionHandler.firstcall){
            PositionHandler.firstcall = true;
            
        }*/
    if(trigger.isafter && trigger.isupdate){
        for(Account acc : trigger.new){
            /*if(acc.Parent.Position__c == null){
                accList.add(acc);
            }*/
            accIdSet.add(acc.Id);
        }
        
        for(Account a : [Select Id, ParentId, Parent.Name, Parent.Position__c FROM Account WHERE Id IN : accIdSet]){
            System.debug('***** position= '+a.Parent.Position__c);
            if(a.Parent.Position__c == null){
                accList.add(a);
            }
        }
        
        if(accList.size() > 0){
            PositionHandler.populateposition(accList);    
        }
        
    }

}