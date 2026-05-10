public class PR_OpportunityHelper_02 {
    
    public static void beforeDelete(List<Opportunity> oldOpportunityList){
        
        //Opport - parent
        //Related activities : task and event - child
        //Soql - parent to child
        Set<id> OpportunityWithRelList = new Set <id>();
        for (Opportunity opp : [SELECT Id, (SELECT ID FROM Tasks),(SELECT ID FROM Events) FROM Opportunity WHERE ID IN : oldOpportunityList ]){
            List <Task> taskList = opp.Tasks;
            List <Event> eventList = opp.Events;
            if(!taskList.isEmpty() || !eventList.isEmpty()){
                OpportunityWithRelList.add(opp.Id);
            }        
        }
        
        for(Opportunity opp : oldOpportunityList){
            if(OpportunityWithRelList.Contains(opp.Id)){
                opp.addError('You Cannot delete Opportunities with task and Events');   
            }
            
        }
    }
}