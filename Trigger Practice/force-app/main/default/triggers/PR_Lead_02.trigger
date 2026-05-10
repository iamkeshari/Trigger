trigger PR_Lead_02 on Lead (before Insert , before Update) { 
    
    //On the lead Object  validate the Email Field, 
    //if the Email Domain is not from an allowed List (e.g.'example.com' or 'company.com') clean the email field
    
    if(Trigger.isBefore){
        if (trigger.isInsert) {
            PR_LeadHandler_02.beforeInsert(Trigger.New);
        }else if (Trigger.isUpdate) {
            PR_LeadHandler_02.beforeUpdate(Trigger.New, Trigger.OldMap);
        }  
        
    }
    
}