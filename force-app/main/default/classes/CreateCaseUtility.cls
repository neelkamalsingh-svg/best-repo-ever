public class CreateCaseUtility {
 public static Case createCase(Id accId) {
  Case caseObj = new Case(AccountId = accId, Status = 'New', Origin = 'Phone');
  insert caseObj;
  return caseObj;
 }
}