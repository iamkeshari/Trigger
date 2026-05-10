public class PR_ContactHandler_02 {
    
    public static void updateDesc(List<Contact> conList , Map<Id,Contact> oldMapList){
        
        Map<Id, String> accountUpdates = new Map<Id, String>();
        for (Contact con : conList) {
            if (con.Description != null && oldMapList.get(con.Id).Description != con.Description) {
                accountUpdates.put(con.AccountId, con.Description);
            }
        }
        // Query related Accounts that need updating
        List<Account> accList = [SELECT Id, Description FROM Account WHERE Id IN :accountUpdates.keySet()];

        // Update Account descriptions
        for (Account acc : accList) {
            acc.Description = accountUpdates.get(acc.Id);
        }

        if (!accList.isEmpty()) {
            update accList;  // Bulk update to avoid DML limits
        }
    }
}