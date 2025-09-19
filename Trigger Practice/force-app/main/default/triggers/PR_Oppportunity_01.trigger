trigger PR_Oppportunity_01 on Opportunity (before insert) {
    
/* Create a trigger on the Opportunity object to automatically set the StageName based on the Amount field when a new Opportunity is inserted.
If Amount is null or less than 50,000, set StageName to Prospecting.
If Amount is between 50,000 and 250,000, set StageName to Negotiation/Review.
If Amount is greater than 250,000, set StageName to Closed Won.*/
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PR_OpportunityHandler_01.beforeHandler(Trigger.New);
        }
    }
    
    
}