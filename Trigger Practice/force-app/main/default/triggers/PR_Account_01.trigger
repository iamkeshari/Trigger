trigger PR_Account_01 on Account (before insert) {
    /*Create a trigger on the Account that automatically set the rating field when annualRevenue whenever a new account is created .
      if Annual Revenue is null or less than 10000 setting to cold.
      if annual revenue is greater than or equal 10000 but less than 50000 Set Rating to Warm.
      if annual revenue is greater than or equal to 50000, set Rating to Hot
    */
    
    if (Trigger.isInsert && Trigger.isBefore){
        PR_HandlerClass_01.beforeHandler(Trigger.New);
    }

}