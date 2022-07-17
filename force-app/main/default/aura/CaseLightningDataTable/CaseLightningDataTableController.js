({
	doInit : function(component, event, helper) {
        var cols = [{label: 'Case Number', fieldName: 'CaseNumber', type: 'text'},
                   {label: 'Subject', fieldName: 'Subject', type: 'text'},
                   {label: 'Priority', fieldName: 'Priority', type: 'text'},
                       {label: 'Status', fieldName: 'Status', type: 'text'}];
        alert(cols);
		component.set ('v.coloumns',cols)
      

	},
    handleRowSelection : function(component, event, helper) {
        var selectedCase = event.getParam('selectedRows');
       
        component.set ('v.selectedCase',selectedCase[0]);
    }
    
})