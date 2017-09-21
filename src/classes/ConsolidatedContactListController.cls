public class ConsolidatedContactListController {
	 public Account acc=new Account();
	 public List<cContact> contactList {get; set;}
    
 public ConsolidatedContactListController(ApexPages.standardController std){
        acc=(Account)std.getRecord();
        showContacts();
        Account accnt=[Select Consolidated_Contacts__c from Account where id=:acc.id];
      
       //ensuring the already checked contacts have been checked the next time a vf page is opened
        if(accnt.Consolidated_Contacts__c!=null){
        String contactNames=accnt.Consolidated_Contacts__c;
        List<String> cn=contactNames.split(' ,');
        Set<String> cn1=new Set<String>();
        cn1.addAll(cn);
         //checking the already selected contacts
        for(cContact c:contactList){
            String name=c.con.FirstName+' '+c.con.LastName;
            if(cn1.contains(name)){
                c.selected=true;
            }
        }
        
        }
	
 }  
    
    //This method uses a simple SOQL query to return a List of Contacts and along with the boolean
	  private void showContacts(){
        List<Contact> con=[select id,FirstName,LastName from Contact where AccountId=:acc.id];
        contactList=new List<cContact>();
        for(Contact c:con){
            contactList.add(new cContact(c));
        }
      }
          
          // This is our wrapper/container class which contains both the standard salesforce object Contact related to the account and a Boolean value whihc is by default given a false value
	public class cContact {
		public Contact con {get; set;}
		public Boolean selected {get; set;}
        public cContact(Contact c) {
			con = c;
			selected = false;
		}
	}
         


	   public PageReference consolidate(){
      List<Contact> selectedContacts = new List<Contact>();
        String consolidatedNames='';
        for(cContact cCon: contactList) {
			if(cCon.selected == true) {
				
                consolidatedNames+=cCon.con.FirstName+' '+cCon.con.LastName+' ,';
			}
		}
        
        Account acc=new Account(id=acc.id,Consolidated_Contacts__c=consolidatedNames);
        update acc;
        
	PageReference pg=new PageReference('/'+acc.id);
        return pg;
    }
   


	
}