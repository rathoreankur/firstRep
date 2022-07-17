public class createAccountAura {
    @AuraEnabled
	public static AccountWrapper initAction(string recordIdStr){
        AccountWrapper datawrapper = new AccountWrapper();
       Account acc = [Select Id, Name, Type, Industry, Rating From Account Where Id=: recordIdStr];
		datawrapper.name = acc.Name;
        datawrapper.industry = acc.Industry;
        datawrapper.rating = acc.Rating;
        datawrapper.type = acc.Type;
        System.debug('datawrapper'+datawrapper);
        return datawrapper;
    }
    

}