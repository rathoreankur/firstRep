trigger testScenario1 on Case (before insert) {
    for(case c :trigger.New){
        if(c.origin == 'Email'){
            c.Status = 'New';
            c.Priority = 'Medium';
        }
    }

}