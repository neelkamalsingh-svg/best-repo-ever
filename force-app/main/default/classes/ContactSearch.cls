public class ContactSearch {
    public static List<Contact> searchForContacts(String LName, String MailingPostalCodeVar){
        List<Contact> cont_List = [Select id, name from Contact where LastName=:LName AND MailingPostalCode=:MailingPostalCodeVar];
   List<Contact> cont_List1 = Database.query('Select id, name from Contact');        

        return cont_List;
    }
}