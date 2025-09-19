public class PR_AccountHandler_02 {
    //Related Contacs
    public static void afterAccountHolder(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact (LastName = acc.Name + 'con', AccountId = acc.Id);
            conList.add(con);
        }
        insert conList;
    }
   
}