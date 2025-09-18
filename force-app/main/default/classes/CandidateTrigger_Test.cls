@isTest
public class CandidateTrigger_Test{
static testMethod void testPositiveScenario(){
 Candidate__c CandVar1 = new Candidate__c();
 CandVar1.Name__c='Test Candidate';
 CandVar1.Email__c   ='test@test.com';
// Test.startTest();
 insert CandVar1;
 //Test.stopTest();

system.assertEquals('Test Candidate',CandVar1.Name__c);
}

}