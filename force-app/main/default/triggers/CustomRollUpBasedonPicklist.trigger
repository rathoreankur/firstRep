// Requirement - Create a picklist field Status on contact with 3 values(Draft,InProgress,Completed) Create 3 number field
// on Account for each Picklist Option(Draft,InProgress,Complete) when an contact is Created,Updated,deleted Update the related number Field on
//Account with the contact Count With each Status
trigger CustomRollUpBasedonPicklist on Contact (after insert,after update,after delete) {
    Set<Id> accountId = new Set<Id>();
    List<Account> accountListToUpdate = new List<Account>();
    Integer draft = 0;
    Integer inProgress = 0;
    Integer completed = 0;

    if(trigger.isAfter ){
        if(trigger.isInsert || trigger.isUpdate){
            for(Contact con : trigger.new){
                accountId.add(con.AccountId);
            }
            
        }
        
    }

}