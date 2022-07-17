public with sharing class contactTriggerIsActiveHandler {
    
    public static void checkMe(List<Contact> newConList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : newConList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        List<Account> accList = [SELECT Id, (SELECT Id, Is_Active__c from Contacts), Is_Active__c  from Account where id in : accIds];
        for(Account a : accList){
            for(Contact c : a.Contacts){
                if(c.Is_Active__c==true){
                    a.Is_Active__c=true;
                }
                else{
                    a.Is_Active__c=false;
                }
            }
        }
        System.debug('accList'+accList[0].Is_Active__c);
        update accList;
    }
}