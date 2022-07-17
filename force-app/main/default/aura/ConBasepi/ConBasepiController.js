({
	doInIt : function(component, event, helper) {
		 var action = component.get('c.coinbaseAPimethod');

        
        action.setParams({
            
        }); 
        action.setCallback(this, function(data) {
            var responseData = data.getReturnValue();
            console.log(responseData);
             alert(JSON.stringify(responseData.time));			
            if(!$A.util.isEmpty(responseData) && responseData != null){
                component.set("v.dataWrapper",responseData);
            }		
        });
        // perform action
        $A.enqueueAction(action);       
	}
})