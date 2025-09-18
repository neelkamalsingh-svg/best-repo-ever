@RestResource(urlMapping='/showaccountdetails/*')
Global class RestAPIAccountdetails {
    
    /*
    For executing below method, use the syntax, from workbench REST Explorer:
    /services/apexrest/showaccountdetails/
    */
    @httpget
    Global static Account doGet()
    {
        RestRequest req = RestContext.request;
        //RestResponse res = RestContext.response;
        string accountid=req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
        System.debug('Account id ' + accountid);
        Account acc =[select Name , phone from Account where id=:accountid];
        
        return acc;
    }
    /*
    For executing below @httppost method, use the syntax:
    URL - /services/apexrest/showaccountdetails/
    json body syntax
        {
            "Accountname" :"tesfffff",
            "Aphone":"999999999"
        } 
    */
    @httppost
    Global static string doPost(string Accountname ,String Aphone)
    {
        Account acc = new Account(Name=Accountname ,phone=Aphone);
        insert acc;
        return acc.id;
    }
    @httppatch
    Global static string dopatch(string AccountId , String Aphone)
    {
        Account acc=[select Name ,Phone from Account where id=:AccountId];
        acc.phone=Aphone;
        update acc;
        return acc.phone;
        
    }

}