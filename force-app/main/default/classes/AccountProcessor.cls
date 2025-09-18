global class AccountProcessor {
@future
    public static void countContacts(List<Id> AccountId){
     
        List<AggregateResult> agrRsltList = [SELECT count(Id) countC , AccountId acctid FROM Contact WHERE AccountId =: AccountId Group by AccountId ];
        Map<Id,Decimal> AcctContCountMap = new Map<Id,Decimal>();
        for(AggregateResult AgrResult : agrRsltList){
            //Id idVar =(Id) AgrResult.get('expr0');
            //Integer intVar=(Integer)AgrResult.get('expr1');
            AcctContCountMap.put((Id)AgrResult.get('acctid'), (Decimal) AgrResult.get('countC') );
        }
       
        //Update Account object, count of contacts
        List<Account> accListUpdate = [Select id, Number_of_Contacts__c FROM Account WHERE id =:AccountId];
        for(Account accVar:accListUpdate) {
            accVar.Number_of_Contacts__c=AcctContCountMap.get(accVar.Id);
        }
        UPDATE accListUpdate;
        
    }
}