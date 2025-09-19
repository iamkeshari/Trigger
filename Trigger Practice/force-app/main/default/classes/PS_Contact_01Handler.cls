public class PS_Contact_01Handler {
    
    public static void beforeUpdate(List<Contact> conList){
        for(Contact con : conList){
            if(string.isNotBlank(con.FirstName)){
                con.firstname = 'Kumar '+ con.firstname; 
            }else{
                con.firstName = 'Kumar';
            }        
        }
    }
    
}