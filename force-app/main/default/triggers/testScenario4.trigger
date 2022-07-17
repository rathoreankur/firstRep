//Trigger Scenario 5 :
//Creates the number of contacts which are equal to the number which we will enter in the Number of Locations field on the Account Object.

trigger testScenario4 on Account (after update) {
    List<Contact> listContact = new List<Contact>();
    map<Id,Decimal> mapacc = new map<Id,Decimal>();
    for(Account acc:trigger.new){
        mapAcc.put(acc.id,acc.NumberofLocations__c);
    }
    
    
    /*
    if(mapAcc.size()>0 && mapAcc!=null){
        for(Id accId:mapAcc.keyset()){
            for(integer i=0;i<mapAcc.get(accId);i++){
                contact newContact=new contact();
                newContact.accountid=accId;
                newContact.lastname='contact'+i;
                listContact.add(newContact);
            }
        }
    }
    if(listContact.size()>0 && listContact!=null){
        insert listContact;
    } */
}