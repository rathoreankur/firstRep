trigger MaillingAddressTrigger on Account (after Update) {
    List<Contact> conList = new List<Contact>();
    Map<Id,Account> accmap = new Map<Id,Account>();
    if(trigger.isAfter){
        if(trigger.isUpdate){
            for(Account acc :trigger.new){
                Account accold = Trigger.oldMap.get(acc.id);
                if(accold.shippingcity != acc.shippingcity ||accold.ShippingCountry != acc.ShippingCountry || accold.ShippingState != acc.ShippingState || accold.ShippingCountry != acc.ShippingCountry){
                    accmap.put(acc.Id, acc);
                }
            }
            
            for(Contact con :[Select Id, MailingCity, AccountId From Contact Where AccountId =:accmap.keySet()]){
                if(accmap.containsKey(con.AccountId)){
                    con.MailingCity = accmap.get(con.AccountId).shippingcity;
                    con.MailingState = accmap.get(con.AccountId).ShippingState;
                    con.MailingCountry = accmap.get(con.AccountId).ShippingCountry;
                    conList.add(con);
                } 
            }
            
            if(conList.size()>0){
                update conList;
            }
        }
    } 
}