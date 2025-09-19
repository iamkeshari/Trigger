trigger PR_Account_02 on Account (after insert) {
    
      //When Account is Created Create Related Account
    if(Trigger.isAfter && Trigger.isInsert){  
        PR_AccountHandler_02.afterAccountHolder(Trigger.new);
    }


}