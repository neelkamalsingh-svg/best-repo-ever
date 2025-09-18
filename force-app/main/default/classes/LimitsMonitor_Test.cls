@isTest
private class LimitsMonitor_Test {
    
    @IsTest
    static void testGetOrgLimits(){
        
        User u = [SELECT id from User where Profile.Name = 'System Administrator' limit 1];
        system.runAs(u){
            Test.startTest();
                LimitsMonitor_Controller.getOrgLimits();
            Test.stopTest();
        }
    }

    @IsTest
    static void testGetObjectLimits(){
            
                Test.setMock(HttpCalloutMock.class, new LimitsMonitor_WebServiceMock());
                LimitsMonitor_Controller.getObjectLimit('Account');
            
    
    }
}