({
	submit : function(component, event, helper) {
		 var action = component.get('c.initAction');
         var accountName = component.get ("v.name");
         alert (accountName);
        action.setParams({
            "accname":accountName
        }); 
        action.setCallback(this, function(data) {
            var responseData = data.getReturnValue();
            if(!$A.util.isEmpty(responseData) && responseData != null){
                component.set("v.Contact",responseData);
            }		
        });
        // perform action
        $A.enqueueAction(action);       
	}
})