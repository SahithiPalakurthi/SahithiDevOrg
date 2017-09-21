@isTest
public class TestRestrictContactByName {
    @isTest
    static void TestRestrictContactOnLastName() {
 Contact con = new Contact(LastName='INVALIDNAME');
          Test.startTest();
          insert con;
          Test.stopTest();
}
}