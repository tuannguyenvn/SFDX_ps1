@istest
public with sharing class TestOwnerChange {
    @istest
    private static void TestOwnerChange1() {
        List<Contact> newContacts = InitTestContact('c', 5);

        User user = initTestUser('tuan', 'tuan');

        System.runAs(user) {
            insert newContacts;
        }

        Test.startTest();

        for (Contact ct : newContacts) {
            ct.OwnerId = UserInfo.getUserId();
            ct.Email = 'tuan@testMail.com';
        }

        update newContacts;

        Test.stopTest();

        System.assertEquals( newContacts.size(), ProgramFlowExperiment.EmailCounter);
    }

    public static List<Contact> InitTestContact (String prefix, Integer Count){
        List<Contact> results = new List<Contact>();
        for (Integer x; x<Count; x++) {
            results.add(new Contact(LastName = prefix + '_' + string.valueOf(x),
                                    Email = prefix + '_' + string.valueOf(x) + '@apex4devs.com'));
        }
        return results;
    }

    public static User initTestUser(String username, String thealias)  
    {    
        User u = new User(  Alias = thealias, 
                            Email = username + '@apexfundementals.com', 
                            FirstName='Joe', LastName= username,    
                            TimeZoneSidKey = 'America/Los_Angeles', 
                            UserName = username + '@apex4devs.com', 
                            UserPermissionsMarketingUser=true,    LocaleSidKey='en_US', 
                            EmailEncodingKey='UTF-8', LanguageLocaleKey = 'en_US');
       u.ProfileID = userinfo.getProfileId();
       return u;  
    }
}
