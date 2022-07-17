public class showAccountOportunity {
    // test
    @AuraEnabled
    public static List<Contact> initAction (string accname){
        List <Contact> conList = [select Id,Name,Account.name from Contact where Account.Name =: accname];
        System.debug('***Contact List'+conList);
        return conlist;
        
    }
}