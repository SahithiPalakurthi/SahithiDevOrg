public class ContactSearch {
    public static list<Contact> searchForContacts(String name,String pin){
        Contact[] cts = [SELECT Name,ID FROM Contact WHERE LastName =:name AND MailingPostalCode=:pin];
 		return cts;
    }

}