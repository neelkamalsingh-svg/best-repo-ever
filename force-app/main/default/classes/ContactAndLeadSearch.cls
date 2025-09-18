public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String InputText){
       List<List<SObject>> searchList = [FIND :InputText IN ALL FIELDS 
                   RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)]; 
    return searchList;
    }
}