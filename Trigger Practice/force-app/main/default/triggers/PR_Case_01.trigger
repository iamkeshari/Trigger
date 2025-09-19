trigger PR_Case_01 on Case (before insert) {
    
    //Create a Salesforce trigger that automatically searches for a Contact based on the Web Email field of a Case when the Case is created,
    // and then populates the Contact field on the Case object with the matching Contact.
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PR_CaseHandler_01.beforeInsert(Trigger.New);
        }
    }
}