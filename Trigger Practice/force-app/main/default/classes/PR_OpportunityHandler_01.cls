public class PR_OpportunityHandler_01 {
      
    public Static void beforeHandler(List<Opportunity> oppList){
        for (Opportunity opp : oppList ){
            
            //If Amount is null or less than 50,000, set StageName to Prospecting.
            if(opp.Amount == null || opp.Amount < 50000){
                opp.StageName = 'Prospecting'; 
                
            //If Amount is between 50,000 and 250,000, set StageName to Negotiation/Review.   
            }else if (opp.Amount <= 50000 || opp.Amount >= 250000){
                opp.StageName = 'Negotiation/Review';
                
            //If Amount is greater than 250,000, set StageName to Closed Won.*/   
            }else if (opp.Amount > 250000) {
                opp.StageName = 'Closed Won';
            } 
            
        }
    }
}