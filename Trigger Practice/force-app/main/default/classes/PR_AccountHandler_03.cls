public class PR_AccountHandler_03 {
    
    public static void updateRelCon(List<Account> accList , Map<id,Account> accMap){
        Map<Id, Account> updatedAccounts = new Map<Id, Account>();
        For(Account acc : accList){
            if(accMap.get(acc.Id).Phone != acc.Phone){ //its check oldid and new id changes
                updatedAccounts.put(acc.Id,acc); //Add to the map if phone is updated
            }
        }
        
        List<Contact> conList = [Select Id, Name, Phone, AccountID From Contact Where AccountId IN : updatedAccounts.keySet()];
        List<Contact> updatePhoneContacts = new List<Contact>();
        for (Contact con : conList) {
            // Ensure account phone is not null before updating
            if (updatedAccounts.containsKey(con.AccountId)) {
                con.Phone = updatedAccounts.get(con.AccountId).Phone;
                updatePhoneContacts.add(con);
            }
        }
        update updatePhoneContacts;
        
    }
    
}