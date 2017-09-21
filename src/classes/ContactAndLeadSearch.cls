public class ContactAndLeadSearch {
    public static list<list<sObject>> searchContactsAndLeads(String Name){
        String n = Name;
        List<List<sObject>> searchList = [FIND :Name IN NAME FIELDS

                   RETURNING Contact(Name),Lead(Name)];

Contact[] searchContacts = (Contact[])searchList[0];
Lead[] searchLeads = (Lead[])searchList[1];
        Return searchList;
    }

}