trigger PR_Contact_01 on Contact (after update) {
    
    //if the email address of contact gets updated then email address of related account should also get updated.
    
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            PR_Contact_01_updateEmail.updateEmail(Trigger.New,Trigger.OldMap);
        }
    }

}