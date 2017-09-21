@isTest
public class TestVerifyDate {
 
   @isTest  static void testDateBeforeNextMonth() {
      	Date first=VerifyDate.CheckDates(Date.newInstance(2015,1,1),Date.newInstance(2015,1,2));
        System.assertEquals(Date.newInstance(2015,1,2),first);
    }
    
 @isTest static void testDateAfterNextMonth() {
     	Date second=VerifyDate.CheckDates(Date.newInstance(2015,1,1), Date.newInstance(2015,3,2));
        System.assertEquals(Date.newInstance(2015,1,31),second);
    }
    
  @isTest  static void testDateInThePast() {
      	 Date a=VerifyDate.CheckDates(Date.newInstance(2015,1,10),Date.newInstance(2015,1,2));
        System.assertEquals(Date.newInstance(2015,1,31),a);
    }
   }