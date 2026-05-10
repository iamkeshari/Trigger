trigger PR_Lead_01 on Lead (before insert) {
    
    //Create a Trigger on the lead object to automatically set the leadSource based on the company field when a new lead is created 
    //if the company field is blank ,Set leadsource to other.
    //if the company starts with "Sales" set Leadsource to phone Inquiry
    ///for all other values of company , set leadsorce to web.
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PR_LeadHandler_01.beforeHandler(Trigger.New);
        }
    }

}