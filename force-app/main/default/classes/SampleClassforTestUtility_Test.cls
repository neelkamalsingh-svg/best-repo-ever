@isTest
public class SampleClassforTestUtility_Test {
    static testMethod void ValidateDummyClassSingleDefault(){      
        TestUtility.createCase();
        SampleClassforTestUtility sampleClass = New SampleClassforTestUtility();
                    
        // make sure Cases are created.
        List<Case> caseCreatedList =  (List<Case>) TestUtility.getCases();
        //caseCreatedList = [Select Id, AccountId from Case];
        //System.Debug('Single 1: ' + caseCreatedList[0].AccountId);
        System.assertEquals(1, caseCreatedList.size());
        System.assertEquals(1, sampleClass.DummyClass());        
    }
    
	static testMethod void ValidateDummyClassMultipleDefault(){      
        TestUtility.createCases(5);
        SampleClassforTestUtility sampleClass = New SampleClassforTestUtility();
        
        // make sure Cases are created.
        List<Case> caseCreatedList =  (List<Case>) TestUtility.getCases();
        System.assertEquals(5, caseCreatedList.size()); 
        System.assertEquals(5, sampleClass.DummyClass());        
    }
    
    static testMethod void ValidateDummyClassSinglewithParam(){
        Map < String, Object > CaseFieldValueMap = new Map < String, Object > ();
        CaseFieldValueMap.put('Subject', 'Test for Electrical Case Creation');
        CaseFieldValueMap.put('Type', 'Electrical');
        CaseFieldValueMap.put('Priority', 'Low');        
        TestUtility.createCase(CaseFieldValueMap);

        SampleClassforTestUtility sampleClass = New SampleClassforTestUtility();        
        List < String > caseQueryFieldsList = new List < String > {'AccountId', 'Origin', 
            'Status', 'Priority', 'Subject', 'Type'};
                    
        // make sure Cases are created.
        List<Case> caseCreatedList =  (List<Case>) TestUtility.getCases(CaseQueryFieldsList);
        System.assertEquals(1, caseCreatedList.size()); 
        Integer validateCaseOriginCount = 0;
        for(integer i=0; i<caseCreatedList.size(); i++){
            if (caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated' && caseCreatedList[i].AccountId != null)
                validateCaseOriginCount++;          
        }
        System.assertEquals(1, validateCaseOriginCount) ; 
        System.assertEquals(1, sampleClass.DummyClass());        
    }
    static testMethod void ValidateDummyClassMultiplewithParam(){
        Map < String, Object > CaseFieldValueMap = new Map < String, Object > ();
        CaseFieldValueMap.put('Subject', 'Test for Electrical Case Creation');
        CaseFieldValueMap.put('Type', 'Electrical');
        CaseFieldValueMap.put('Priority', 'Low');        
        TestUtility.createCases(CaseFieldValueMap, 5);

        SampleClassforTestUtility sampleClass = New SampleClassforTestUtility();        
        List < String > caseQueryFieldsList = new List < String > {'AccountId', 'Origin', 
            'Status', 'Priority', 'Subject', 'Type'};
                    
        // make sure Cases are created.
        List<Case> caseCreatedList =  (List<Case>) TestUtility.getCases(CaseQueryFieldsList);
        System.assertEquals(5, caseCreatedList.size()); 
        Integer validateCaseOriginCount = 0;
        for(integer i=0; i<caseCreatedList.size(); i++){
            //system.debug('caseCreatedList[i].AccountId: ' + caseCreatedList[i].AccountId);
            if (caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated'  && caseCreatedList[i].AccountId != null)
                validateCaseOriginCount++;          
        }
        System.assertEquals(5, validateCaseOriginCount) ; 
        System.assertEquals(5, sampleClass.DummyClass());        
    }
    static testMethod void ValidateGenericCreateObject(){
        //Create single case with default value
        Case createdCase = (Case) TestUtility.createsObject('Case');
        SampleClassforTestUtility sampleClass = New SampleClassforTestUtility(); 
		//create single case with overwrite value        
        Map < String, Object > CaseFieldValueMap = new Map < String, Object > ();
        CaseFieldValueMap.put('Subject', 'Test for Electrical Case Creation');
        CaseFieldValueMap.put('Type', 'Electrical');
        CaseFieldValueMap.put('Priority', 'Low'); 
        createdCase = (Case) TestUtility.createsObject('Case', CaseFieldValueMap);    
        //query mandatory fields from created records 
        List<Case> caseCreatedList = (List<Case>)TestUtility.getSObjectWithRequiredFields('Case', null, false);
        System.assertEquals(2, caseCreatedList.size()); 
        Integer validateCaseOriginCount = 0;
        for(integer i=0; i<caseCreatedList.size(); i++){
            if (caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated' && caseCreatedList[i].AccountId != null)
                validateCaseOriginCount++;          
        }
        System.assertEquals(2, validateCaseOriginCount) ; 
        System.assertEquals(2, sampleClass.DummyClass());  
        //create 5 cases with default value
        caseCreatedList = (List<Case>)TestUtility.createsObjects('Case', 5);
        System.assertEquals(5, caseCreatedList.size()); 
        //query mandatory fields from created records 
        caseCreatedList = (List<Case>)TestUtility.getSObjectWithRequiredFields('Case', null, false);
        validateCaseOriginCount = 0;
        for(integer i=0; i<caseCreatedList.size(); i++){
            if (caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated' && caseCreatedList[i].AccountId != null)
                validateCaseOriginCount++;          
        }
        System.assertEquals(7, validateCaseOriginCount) ; 
        System.assertEquals(7, sampleClass.DummyClass()); 
		//create 3 cases with overwrite value
        List < String > caseQueryFieldsList = new List < String > {'AccountId', 'Origin', 
            'Status', 'Priority', 'Subject', 'Type'};
        //query mandatory fields from created records         
        caseCreatedList = (List<Case>)TestUtility.createsObjects('Case', CaseFieldValueMap, 3);       
        System.assertEquals(3, caseCreatedList.size()); 
        caseCreatedList = (List<Case>)TestUtility.getSObjectWithRequiredFields('Case', caseQueryFieldsList, false);
        validateCaseOriginCount = 0;
        for(integer i=0; i<caseCreatedList.size(); i++){
            if (caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated' && caseCreatedList[i].AccountId != null)
                validateCaseOriginCount++;          
        }
        System.assertEquals(10, validateCaseOriginCount) ; 
        System.assertEquals(10, sampleClass.DummyClass()); 
		Integer validateCaseTypeCount = 0;        
        for(integer i=0; i<caseCreatedList.size(); i++){
            if (caseCreatedList[i].Type == 'Electrical' && caseCreatedList[i].Origin == 'Web' && caseCreatedList[i].Status == 'Escalated' && caseCreatedList[i].AccountId != null)
                validateCaseTypeCount++;          
        }
        System.assertEquals(4, validateCaseTypeCount) ;         
    }
    
}