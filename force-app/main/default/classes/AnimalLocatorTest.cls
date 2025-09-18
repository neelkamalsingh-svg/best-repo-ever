@isTest
public class AnimalLocatorTest  {
    public static testMethod void testPositive(){
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
            String response = AnimalLocator.getAnimalNameById(1);
    // Verify that the response received contains fake values
    
    }
}