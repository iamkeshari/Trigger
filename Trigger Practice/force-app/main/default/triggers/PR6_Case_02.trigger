trigger PR6_Case_02 on Case (before insert) {

    /*Create a Salesforce trigger that automatically searches for a Account based on the Phone field of a Case when the Case is created,
    and then populates the Account field on the Case object with the matching Account

    */
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PR6_CaseHandler_02.beforeInsert(Trigger.New);
        }
    }

}