public class PR_HandlerClass_01 {
    
    public static void beforeHandler(List<Account> accList){
        
        for(Account acc : accList){
            //if Annual Revenue is null or less than 10000 setting to cold.
            if (acc.AnnualRevenue == null || acc.AnnualRevenue < 10000 ){
                acc.Rating = 'Cold';
                
            // if annual revenue is greater than or equal 10000 but less than 50000 Set Rating to Warm.
            }else if (acc.AnnualRevenue >=10000 && acc.AnnualRevenue < 50000 ){
                acc.Rating = 'Warm';
                
            //if annual revenue is greater than or equal to 50000, set Rating to Hot   
            }else if(acc.AnnualRevenue >= 50000){
                acc.Rating = 'Hot';
            }
            
        }
        
    }
}