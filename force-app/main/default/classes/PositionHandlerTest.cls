@isTest
public class PositionHandlerTest {
    // Utility method that can be called by Apex tests to create price book entries.
    static testmethod void addAccounts() {
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Anita H. Perry';
        acc.ParentId = '0015i000009Xvz3AAC';
        
        accList.add(acc);
        Account acc2 = new Account();
        acc2.Name = 'Angela L. Hennig';
        acc2.ParentId = '0015i000009Xvz3AAC';
        accList.add(acc2);
        
        Account acc3 = new Account();
        acc3.Name = 'Robert I. Preston';
        acc3.ParentId = '0015i000009Xvz8AAC';
        accList.add(acc3);
        insert accList;

        
        
        
    }
}