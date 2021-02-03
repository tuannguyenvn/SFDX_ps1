/**Trigger update Contact with lastname = Nguyen when a Account was edited  */
trigger UpdateContactAddress on Account(after update) {
  for (Account acc : Trigger.new) {
    List<Contact> contacts = [SELECT Id FROM Contact WHERE LastName = 'Nguyen'];
    for (Contact item : contacts) {
      item.MailingStreet = acc.BillingStreet;
      item.MailingCity = acc.BillingCity;
      item.MailingPostalCode = acc.BillingPostalCode;
      item.MailingState = acc.BillingState;
    }
    update contacts;
  }
}
