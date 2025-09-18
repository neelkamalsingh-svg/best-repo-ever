@isTest
public class CreateCaseUtility_Test {
 private static testMethod void testCreateCase() {
  // getting RecordtypeId dynamically
  String recordTypeId = [SELECT Id FROM RecordType WHERE Name = 'Standard'
   													 AND SObjectType = 'Account'
   					    ].Id;

  // first need to create account
  Map < String, Object > caseFieldValueMap = new Map < String, Object > ();
  caseFieldValueMap.put('Type', 'Prospect');
  caseFieldValueMap.put('Name', 'Test Account-1');
  caseFieldValueMap.put('RecordTypeId', recordTypeId);
  caseFieldValueMap.put('CurrencyIsoCode','USD'); 
  // here we are creating account using Test Utility method
  TestUtility.createAccount(caseFieldValueMap);

  // We need only Account Id to be returned
  // so not passing any field list
  List < Account > createdAccountList = TestUtility.getAccounts();
  // just making sure account has been created.
  System.assertNotEquals(null, createdAccountList);
  System.assertEquals(1, createdAccountList.size());

  // Now testing CreateCaseUtility.createCase
  Test.startTest();
  CreateCaseUtility.createCase(createdAccountList[0].Id);
  Test.stopTest();

  // here we are querying case record to make sure 
  // CreateCaseUtility.createCase has created one case record.
  List < Case > caseList = TestUtility.getCases(new List < String > {
   'AccountId',
   'Status',
   'Origin'
  });
  System.assertNotEquals(null, caseList);
  System.assertEquals(1, caseList.size());

  // making sure created case field has same expected value 
  System.assertEquals(createdAccountList[0].Id, caseList[0].AccountId);
  System.assertEquals('Phone', caseList[0].Origin);
 }
}