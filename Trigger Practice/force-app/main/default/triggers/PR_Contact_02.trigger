trigger PR_Contact_02 on Contact (after Update) {
// Whenever a Contact's description is updated, update its parent Account's description
    if(trigger.isAfter){
        PR_ContactHandler_02.updateDesc(Trigger.New, Trigger.OldMap);
    }
}