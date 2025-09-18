public class RandomContactFactory {

    // Method to generate a list of contacts with unique first names and a common last name
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        // Initialize the list to store the contacts
        List<Contact> contacts = new List<Contact>();

        // Loop to generate the required number of contacts
        for (Integer i = 0; i < numberOfContacts; i++) {
            // Create a new contact with a unique first name and the common last name
            Contact con = new Contact();
            con.FirstName = 'Test ' + i;
            con.LastName = lastName;

            // Add the contact to the list
            contacts.add(con);
        }

        // Return the list of generated contacts
        return contacts;
    }
}