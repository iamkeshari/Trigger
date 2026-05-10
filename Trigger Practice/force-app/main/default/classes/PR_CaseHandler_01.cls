public class PR_CaseHandler_01 {
    
    public static Void beforeInsert(List<Case> caseList){
        //get all the web emails
        Set<String> webEmailSet = new Set<String>();
        for(Case csRec : caseList ){
            if(String.isNotBlank(csRec.SuppliedEmail)){
                webEmailSet.add(csRec.SuppliedEmail.toLowerCase());
                
            }          
        }
        // get the contacts based on web email
        Map<String, Id> emailToContactMap = new Map<String, Id>();
        for(Contact con : [select id,Email from contact where email In :webEmailSet]){
            emailToContactMap.put (con.Email,con.Id);
        }
        
        //Populate the Contactid of the case
        
        for (Case csRec : caseList){
            if(String.isNotBlank(csRec.SuppliedEmail)){
                Boolean isContactFound = emailToContactMap.containsKey(csRec.SuppliedEmail.toLowerCase());
                
                if (isContactFound == true){
                    Id contactIdOfContact = emailToContactMap.get(csRec.SuppliedEmail.toLowerCase());
                    csRec.ContactId = contactIdOfContact;
                } 
            }
            
        }
        
    }
}