({
	handleOnChange : function(component, event, helper) {
	    var action = component.get('c.initAction');
        var PrioritytName = component.get("v.selectedItem");
        var caseStatus = component.get("v.caseStatus");
       // alert(PrioritytName)
       // alert(caseStatus)
         action.setParams({
            "priority": PrioritytName,
            "status":caseStatus
        }); 
                
        action.setCallback(this, function(data) {
            var responseData = data.getReturnValue();
            if(!$A.util.isEmpty(responseData) && responseData != null){
                component.set("v.case",responseData);
            } else {
                     component.set("v.case",'');

            }		
        });
        // perform action
        $A.enqueueAction(action); 
	}
})