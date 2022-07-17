//Trigger Scenario 3 :
//Whenever New Account Record is created then needs to create associated Contact Record automatically.
trigger testScenario3 on Account (after insert) {
    List<Contact> conList = new List<Contact>();
            for(Account acc: Trigger.New){
            Contact c=new Contact();
            c.accountid=acc.id;
            c.lastname=acc.name;
            c.phone=acc.phone;
            conList.add(c);
           }
   insert conList;

}