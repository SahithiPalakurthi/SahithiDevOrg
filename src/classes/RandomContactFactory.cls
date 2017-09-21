public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lastname) {
        List<Contact> cons = new List<Contact>();
        
        for(Integer i=0;i<numOfContacts;i++) {
            
           Contact con = new Contact(FirstName='TestContact' + i,LastName=lastname);
            cons.add(con);
        }
        return cons;
    }
}