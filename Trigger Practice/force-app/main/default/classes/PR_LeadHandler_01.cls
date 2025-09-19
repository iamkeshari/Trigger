public class PR_LeadHandler_01 {
    //if the company field is blank ,Set leadsource to other.
    //if the company starts with "Sales" set Leadsource to phone Inquiry
    ///for all other values of company , set leadsorce to web.
    
    public Static void beforeHandler(List<Lead> leadList){
        
        For(Lead ld : leadList){
            if(ld.Company == '' || ld.Company == null ){
                ld.LeadSource = 'Other';
            } else if (ld.Company.startsWith('Sales')){
                ld.LeadSource = 'Phone Inquiry';
            }else{
                ld.LeadSource = 'Web';
            }
        }
        
    }
    
}