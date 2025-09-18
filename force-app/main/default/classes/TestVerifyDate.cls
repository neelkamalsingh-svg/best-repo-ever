@isTest
public class TestVerifyDate {

    @isTest
    static void testDateWithinRange() {
        // Test when the date is within the range
        Date inputDate = Date.newInstance(2024, 9, 10);
        Date startDate = Date.newInstance(2024, 9, 1);
        Date endDate = Date.newInstance(2024, 9, 30);
        
        Date result = VerifyDate.verifyDateRange(inputDate, startDate, endDate);
        System.assertEquals(inputDate, result, 'The date should be within the range and unchanged.');
    }

    @isTest
    static void testDateOutsideRange() {
        // Test when the date is outside the range
        Date inputDate = Date.newInstance(2024, 8, 10);
        Date startDate = Date.newInstance(2024, 9, 1);
        Date endDate = Date.newInstance(2024, 9, 30);
        
        Date expectedDate = Date.newInstance(2024, 9, 30);
        Date result = VerifyDate.verifyDateRange(inputDate, startDate, endDate);
        System.assertEquals(expectedDate, result, 'The date should be adjusted to the end of the month within the range.');
    }

    @isTest
    static void testDateOnBoundary() {
        // Test when the date is exactly on the start or end of the range
        Date startDate = Date.newInstance(2024, 9, 1);
        Date endDate = Date.newInstance(2024, 9, 30);
        
        Date result1 = VerifyDate.verifyDateRange(startDate, startDate, endDate);
        System.assertEquals(startDate, result1, 'The start date should be within the range.');

        Date result2 = VerifyDate.verifyDateRange(endDate, startDate, endDate);
        System.assertEquals(endDate, result2, 'The end date should be within the range.');
    }
}