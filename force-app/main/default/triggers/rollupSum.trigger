trigger rollupSum on Contact (after insert,after update,after delete,after undelete ) {
    if((trigger.isInsert||trigger.isundelete)&& trigger.isAfter){
        helperRollUpSUmm.methodIncreaseAndDecreaseHandler(trigger.New,'Increase');
    }
    if(trigger.isDelete && trigger.isbefore){
        helperRollUpSUmm.methodIncreaseAndDecreaseHandler(trigger.New,'Decrease');
    }
    if(trigger.isUpdate && trigger.isAfter){
    }

}