public with sharing class ShowCaseBasedOnPickListController {
    @AuraEnabled
    public static List<case> initAction (string priority,string status ){
        List <Case> caseList = new List<Case>(); 
        if(priority != null && priority != '' && status != null && status != ''){
         caseList = [Select Subject, CaseNumber, AccountId, Status, Priority From Case where Priority =: priority AND Status =:status];
        System.debug('***Contact List'+caseList);
        }else{
            if(priority != null){
                System.debug('*****Else'+priority );
                caseList = [Select Subject, CaseNumber, AccountId, Status, Priority From Case where Priority =: priority];
            }

        }

        return caseList;
    }
    
}