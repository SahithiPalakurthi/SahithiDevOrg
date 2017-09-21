public class AccountHandler{
    public static Account insertNewAccount(String name){
       try {
        Account acct = new Account(Name=name);
        insert acct;
        ID acctID = acct.ID;
		Account queriedaccount=[SELECT Account.name FROM Account WHERE ID=:acctID];
		return queriedaccount;
            } catch (DmlException e) {
    System.debug('A DML exception has occurred: ' );
                return null;
}
        

    }

}