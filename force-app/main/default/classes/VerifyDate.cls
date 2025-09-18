public class VerifyDate {
    
    // Method to verify if the given date is within the specified range
    public static Date verifyDateRange(Date inputDate, Date startDate, Date endDate) {
        // Check if the input date is within the range
        if (inputDate >= startDate && inputDate <= endDate) {
            return inputDate;
        } else {
            // If not, return the end date of the month within the range
            return endDate.toStartOfMonth().addMonths(1).addDays(-1);
        }
    }
}