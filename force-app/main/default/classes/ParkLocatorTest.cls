@isTest
public class ParkLocatorTest {
    public static testMethod void  testScenarios(){
         Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        ParkLocator.Country('Germany');
    }

}