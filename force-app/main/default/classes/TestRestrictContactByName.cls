@isTest
public class TestRestrictContactByName {

    @isTest
    static void testInsertWithInvalidName() {
        // Test that inserting a contact with 'INVALIDNAME' as last name fails
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
        
        Test.startTest();
        try {
            insert invalidContact;
            System.assert(false, 'Expected DMLException was not thrown.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Contacts with the last name "INVALIDNAME" cannot be inserted or updated.'));
        }
        Test.stopTest();
    }

    @isTest
    static void testInsertWithValidName() {
        // Test that inserting a contact with a valid last name succeeds
        Contact validContact = new Contact(LastName = 'VALIDNAME');
        
        Test.startTest();
        insert validContact;
        Test.stopTest();
        
        // Verify the contact was inserted
        Contact insertedContact = [SELECT Id, LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('VALIDNAME', insertedContact.LastName, 'The contact with a valid last name should be inserted.');
    }

    @isTest
    static void testUpdateWithInvalidName() {
        // Test that updating a contact to 'INVALIDNAME' fails
        Contact validContact = new Contact(LastName = 'VALIDNAME');
        insert validContact;
        
        validContact.LastName = 'INVALIDNAME';
        
        Test.startTest();
        try {
            update validContact;
            System.assert(false, 'Expected DMLException was not thrown.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Contacts with the last name "INVALIDNAME" cannot be inserted or updated.'));
        }
        Test.stopTest();
    }
}