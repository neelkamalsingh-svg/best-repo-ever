public class AccountManager {
    
    @AuraEnabled
    public static list<Account> fetchAccounts(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:AccountCreds/apexrest/AccountService');
        request.setMethod('GET');        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            list<Account> results = (list<Account>) JSON.deserialize(response.getBody(), list<Account>.class);
            return results;
        } else {
            System.debug('### ' +response.getBody());
        }
		return null;
    }
}