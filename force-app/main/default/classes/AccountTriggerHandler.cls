/*
TriggerHelper class
we need to implement the ITriggerHandler interface. 
We need to add “Implements ITriggerHandler” to the end of the class declaration, and then we 
need to add all of the methods from the interface to the class, even if those methods do not 
contain any logic

*/

public class AccountTriggerHandler implements ITriggerHandler
{
    public Boolean IsDisabled(){
        List<TriggerSettings__c> trigrSwitchList = TriggerSettings__c.getall().values();
        boolean isDisabled=false;
        system.debug('trigrSwitchList :::: '+trigrSwitchList );
        for(TriggerSettings__c trgVar : trigrSwitchList){
        system.debug('trgVar.TriggerName__c ::: '+trgVar.TriggerName__c);
        system.debug('trgVar.isDisabled__c :::: '+trgVar.isDisabled__c);
            if(trgVar.TriggerName__c=='AccountTrigger' && trgVar.isDisabled__c==true){
              isDisabled=true;
            }
            system.debug('Value of isDisabled after if loop ::: '+isDisabled);
        }
      return isDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) 
    {
        // Reject any Accounts which have the word "Test" in the name
        for (Account acc : (List<Account>)newItems)
        {
            if (acc.Name.contains('test'))
                acc.Name.addError('You may not use the word "test" in the account name');
        }
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}