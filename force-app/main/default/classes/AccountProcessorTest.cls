@isTest
public class AccountProcessorTest {
    public static testMethod void createAccount(){
        Test.startTest();
        Account acctVar = new Account();
        acctVar.Name = 'Test Account for testing classes';
        acctVar.Type='Prospect';
        acctVar.CurrencyIsoCode='USD';
        INSERT acctVar;
        
        Id retAcctId=acctVar.Id;
        List<Id> acctIdList = new List<Id>();
        acctIdList.add(retAcctId);
        
        List<Contact> contctList = new List<Contact>();
        Contact contctVar1=new Contact();
        contctVar1.FirstName='FNameTest1';
        contctVar1.LastName = 'LNameTest1';
        contctVar1.CurrencyIsoCode='USD';
        contctVar1.AccountId=retAcctId;
        contctList.add(contctVar1);
        
        Contact contctVar2=new Contact();
        contctVar2.FirstName='FNameTest2';
        contctVar2.LastName = 'LNameTest2';
        contctVar2.CurrencyIsoCode='USD';
        contctVar2.AccountId=retAcctId;
        contctList.add(contctVar2);
        
        INSERT contctList;
        
        //Integer counfContact = [SELECT count() FROM Contact WHERE Accountid = :retAcctId];
        //acctVar.Number_of_Contacts__c=counfContact;
        //Update acctVar;
        
        AccountProcessor.countContacts(acctIdList);
        Test.stopTest();
    }
}