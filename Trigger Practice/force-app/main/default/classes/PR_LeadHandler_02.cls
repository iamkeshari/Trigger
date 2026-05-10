public class PR_LeadHandler_02 {
    
    public static void beforeInsert(List<Lead> newLeadList){
        
        Set<String> allowedDomains = new Set<String>();
        allowedDomains.add('example.com');
        allowedDomains.add('company.com');
        
        for(Lead LeadRec :newLeadList){
            
            if (String.isNotBlank(LeadRec.Email)) {
                String Domain = LeadRec.Email.substringAfter('@').toLowerCase();
                
                if (!allowedDomains.contains(Domain)) {
                    LeadRec.Email = null;   
                }               
            }
        }
    }
    public static void beforeUpdate(List <Lead> newLeadList , Map<Id,Lead> oldLeadMap){
        
        Set<String> allowedDomains = new Set<String>();
        allowedDomains.add('example.com');
        allowedDomains.add('company.com');
        
        for(Lead LeadRec : newLeadList){
            String newEmail = LeadRec.Email;
            Lead oldLead = oldLeadMap.get(LeadRec.Id);
            String oldEmail = oldLead.Email;
            
            if (newEmail != oldEmail && String.isNotBlank(newEmail)) {
                
                String domain = LeadRec.Email.substringAfter('@').toLowerCase();
                if(!allowedDomains.contains(domain)){
                    LeadRec.Email = null;
                    
                }
                
            }
            
        }
        
    }
}