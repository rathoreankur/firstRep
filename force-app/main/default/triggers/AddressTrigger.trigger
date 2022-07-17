trigger AddressTrigger on Address__c (before insert,before update) {
    Set<Id> accIdSet = new Set<Id>();
    List<Address__c> accListToUpdate = new List<Address__c>();
    if(trigger.isBefore){
        if(trigger.isInsert){
            for(Address__c add : trigger.new){
                if(add.Is_Active__c && add.Account__c != null){
                    accIdSet.add(add.Account__c);
                }
                
            }
            if(accIdSet.size()>0){
                for(Address__c ad :[Select Id From Address__c Where Account__c IN : accIdSet AND Is_Active__c = true AND Id NOT IN : trigger.new]){
                    ad.Is_Active__c = false;
                    accListToUpdate.add(ad);
                    
                }
                if(accListToUpdate.size()>0){
                    update accListToUpdate;
                }
            }
            
        }
        
        
    }
    
}