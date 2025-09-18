global class AccountWS{
    
    global class Plan{
        webservice String name;
        webservice Integer planNumber;
        webservice Date planningPeriod;
        webservice Id planId;
    }


    webservice static Plan createAccount(Plan vPlan){
    Account varAcct = new Account();
    varAcct.Name=vPlan.Name;
    varAcct.AccountNumber =String.valueOf(vPlan.planNumber);
    insert varAcct;
    
    vPlan.planId=varAcct.Id;
    
    return vPlan;
    
    }


}