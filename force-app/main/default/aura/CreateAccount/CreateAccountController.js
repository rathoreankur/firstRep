({
	doInIt : function(component, event, helper) {
	var action = component.get('c.initAction');
	var recordId = component.get("v.recordId");
    action.setParams({
            "recordIdStr":recordId
        });
        action.setCallback(this,function(a){
            var responseData = a.getReturnValue();
            component.set("v.dataWrapper",responseData);
              var createRecordEvent = $A.get("e.force:createRecord");
              createRecordEvent.setParams({
                    "entityApiName": "Account",
                  "defaultFieldValues" :{
                      'Name' : component.get("v.dataWrapper").name,
                      'Rating':component.get("v.dataWrapper").rating,
                  }
              });
                createRecordEvent.fire();
                        
        });
        $A.enqueueAction(action);

	}
})