public class PositionHandler {
    public static Boolean firstcall=false;

    public static void populateposition(List<Account> accList){
        
        map<Id,Id> parentAccountPositionmap = new map<Id,Id>();
        List<Account> accListToupdate = new List<Account>();
        //1. populate position on parent account and Account if Position on Parent Account is null
        for(Account acc : accList){
            if(acc.Parent.Position__c == null && acc.ParentId != null ){
                //System.debug('acc'+acc);
                if(parentAccountPositionmap.containsKey(acc.ParentId)){
                    Account account  = new Account(Id = acc.Id,Position__c = parentAccountPositionmap.get(acc.ParentId));
                    accListToupdate.add(account);

                }else{
                    //Position__c position = [Select Id, Name From Position__c Where Name =: acc.Parent.Name];
                    //System.debug('****Position Found'+position);
                    System.debug('*****Parent Account Name'+acc.Parent.Name);
                    //if(position != null){
                        Position__c pos = new Position__c();
                        pos.Name = 'POS - '+[Select Id, Parent.Name From Account WHERE Id =: acc.Id].Parent.Name;
                        insert pos;
                        Account account  = new Account(Id = acc.Id,Position__c = pos.Id);
                        Account paccount = new Account(Id = acc.ParentId,Position__c = pos.Id);
                        accListToupdate.add(account);
                        accListToupdate.add(paccount);                    
                        
                        parentAccountPositionmap.put(acc.ParentId, pos.Id);  
                        system.debug('parentAccountPositionmap.containsKey'+parentAccountPositionmap);
                    //}
                }                
                
            }
            
        }
         if(accListToupdate.size() > 0){
              update accListToupdate;   
            }
        
        
        
    }
}