public with sharing class PR6_CaseHandler_02 {


    public static Void beforeInsert(List<Case> caseList){

        //get all the Phone numbers
        Set<String> webPhoneSet = new Set<String>();
        for(Case csRec : caseList){
            if(String.isNotBlank(csRec.SuppliedPhone)){
                webPhoneSet.add(csRec.SuppliedPhone);
            }                   
        }
        // get the Acounts based on phone numbers
        Map<String, Id> phoneToAccountMap = new Map<String, Id>();
        for(Account acc : [select id,phone from Account where phone IN :webPhoneSet]){
            phoneToAccountMap.put (acc.Phone,acc.Id);
        }

        //Populate the AccountId of the case
        
        for (Case csRec : caseList){
            if(String.isNotBlank(csRec.SuppliedPhone)){
                Boolean iAccountFound = phoneToAccountMap.containsKey(csRec.SuppliedPhone);
                
                if (iAccountFound == true){
                    Id accountIdOfAccount = phoneToAccountMap.get(csRec.SuppliedPhone);
                    csRec.AccountId = accountIdOfAccount;
                } 
            }
            
        }
    }
}