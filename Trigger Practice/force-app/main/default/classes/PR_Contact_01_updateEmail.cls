public class PR_Contact_01_updateEmail {
    
    public static void updateEmail(List<Contact>conList , Map<Id, Contact> oldMap){
        
        Set<Id> AccountIds = new Set<Id>();
        Map<Id, String> contactEmailUpdates = new Map<Id, String>();
        
        // Collect Account IDs and check for email changes
        for(Contact con : conList){
            if(con.AccountId != null && con.Email != null && con.Email != oldMap.get(con.Id).Email){
                AccountIds.add(con.AccountId);
                contactEmailUpdates.put(con.AccountId, con.Email);
            }
        }
        
        if (!AccountIds.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>();
            
            // Query the Accounts that need updating
            Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Email__c FROM Account WHERE Id IN : AccountIds]);
            
            // Update account emails
            for (Id accId : contactEmailUpdates.keySet()) {
                if (accountMap.containsKey(accId)) {
                    accountMap.get(accId).Email__c = contactEmailUpdates.get(accId);
                    accountsToUpdate.add(accountMap.get(accId));
                }
            }
            
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
        
    }
    
}