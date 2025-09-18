public class AccountHandler {
    public static Account insertNewAccount(String strVar){
        Account acct ;
        String name='trinath';
        
       // if ( !String.isEmpty(strVar)) {
        try {
        acct = new Account(Name=strVar, Phone='(415)555-1212', NumberOfEmployees=101);
      
        insert acct ;
            Account RetAccount = [SELECT Id FROM Account WHERE id = :acct.id];
        }
        Catch(Exception e)        {
          acct=null ;
        }
            
    return   acct;   
    }
}