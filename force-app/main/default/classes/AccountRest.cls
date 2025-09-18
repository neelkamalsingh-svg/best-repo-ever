@RestResource(urlMapping='/AccountService/*')
global class AccountRest {
     
    @HttpGet
    global static list<Account> fetchAccounts(){
        return [SELECT Name, AccountNumber, Phone, Website FROM Account order by CreatedDate DESC LIMIT 10];
    }
}