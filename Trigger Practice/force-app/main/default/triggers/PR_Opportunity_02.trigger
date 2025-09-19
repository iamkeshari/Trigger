trigger PR_Opportunity_02 on Opportunity (before delete) {
    
    //Implement an apex Trigger to prevent the deletion of an Opportunity if it has any related Activities.
    if(trigger.isBefore){
        if(trigger.isDelete){
            PR_OpportunityHelper_02.beforeDelete(trigger.old);
        }
    }
     

}