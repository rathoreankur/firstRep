trigger AccountUpdateTrigger on Account (after Update) {
    // update Account Phone to All related Contact
    Map<Id, String> accountIdPhoneMap = new Map<Id, String>();
    List<Contact> contactToUpdateList = new List<Contact>();
    for(Account acc : trigger.new){
       Account  oldAccount = trigger.oldMap.get(acc.Id);
        if( oldAccount.Phone!= acc.Phone){
            accountIdPhoneMap.put(acc.Id, acc.Phone);
        }
    }
    List<Contact> conList = [Select Id, Phone ,AccountId From Contact Where AccountId IN :accountIdPhoneMap.keySet()];
    for(Contact con :conList){
        if(accountIdPhoneMap.containsKey(con.AccountId)){
            con.Phone = accountIdPhoneMap.get(con.AccountId);
        }
        contactToUpdateList.add(con);
    }
   update contactToUpdateList;

}