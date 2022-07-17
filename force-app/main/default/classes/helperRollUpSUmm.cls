public class helperRollUpSUmm {
/*------This Method Handles insert, delete   and Undelete events --------*/
public static Void methodIncreaseAndDecreaseHandler(list<Contact> listContacts,string actionOnAccount){

    // collect ID's of the Parent Accounts, and we have to Update the Same Accounts 
    set<id> setAccountId=new set<id>();
    for(Contact con:listContacts){
        if(con.AccountId!=null)
        setAccountId.add(con.AccountId);
    } 

//Use Map Collection  for Relative Comparision and also To update The Parent Accounts.
    Map<ID,Account> mapIDAndAccount;
    if(setAccountId.size()>0){
    mapIDAndAccount=new  Map<ID,Account>([SELECT ID,Name,Total_Amount__c FROM Account     WHERE ID IN : setAccountId]);  
      for(Contact con:listContacts){
        if(mapIDAndAccount.containsKey(con.AccountId)){
            if(con.Amount__c!=null ){

            //Total_Amount-->Add the Difference Amount
            if(actionOnAccount=='Increase'){
            if(mapIDAndAccount.get(con.AccountId).Total_Amount__c!=null){
               mapIDAndAccount.get(con.AccountId).Total_Amount__c+=con.Amount__c;
              }
              else{
                mapIDAndAccount.get(con.AccountId).Total_Amount__c=con.Amount__c; 
                  }
              }

                  //Total_Amount-->Substract the Difference Amount
                  if(actionOnAccount=='Decrease'){
                  if(mapIDAndAccount.get(con.AccountId).Total_Amount__c!=null){
                    mapIDAndAccount.get(con.AccountId).Total_Amount__c-=con.Amount__c;
                  }
                }
              }
            }
        }
         Update mapIDAndAccount.values();
    }
}

/*---------------------This Method Handles Update Event--------------------- */
public static Void methodToUpdateTotalAmountOfAccount(Map<ID,Decimal> argMapToUpdateAccountAmount,string actionOnAccount){

//get The Parent Accounts ID from MAP  
set<id> setAccountId=argMapToUpdateAccountAmount.keySet();

//List of Accounts which Need to be Updated with Recalculated ToatlAmount
List<Account> listAccountToUpdate=[SELECT ID,Name,Total_Amount__c from Account where ID IN:setAccountId];

for(Account acc:listAccountToUpdate){
        if(argMapToUpdateAccountAmount.ContainsKey(acc.Id)){

            //Total_Amount-->Add the Difference Amount
            if(actionOnAccount=='Increase'){
                if(acc.Total_Amount__c!=null){
                    acc.Total_Amount__c+=argMapToUpdateAccountAmount.get(acc.Id);
                }else{
                    acc.Total_Amount__c=argMapToUpdateAccountAmount.get(acc.Id);
                }
            }

            //Total_Amount-->Substract the Difference Amount
            if(actionOnAccount=='Decrease'){
                if(acc.Total_Amount__c!=null){
                acc.Total_Amount__c-=argMapToUpdateAccountAmount.get(acc.Id);
                   }
            }
        }
    }
    Update listAccountToUpdate;
}
}