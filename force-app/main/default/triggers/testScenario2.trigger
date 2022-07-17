//    Trigger Scenario 2 :
//    When ever Lead is created with LeadSource as Web then give rating as cold otherwise hot.

trigger testScenario2 on Lead (before insert) {
    for(Lead l :trigger.New){
        if(l.LeadSource =='Web'){
            l.Rating = 'cold';
        }
        l.Rating = 'Hot';
    }

}