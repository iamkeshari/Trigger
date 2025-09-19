trigger PR_Account_03 on Account (after update) {
// whenever Account's Phone field is updated
// then all related contact's phone field should also get updated with parent Account's Phone
    if(Trigger.isAfter){
        PR_AccountHandler_03.updateRelCon(Trigger.New ,Trigger.OldMap);
    }

}