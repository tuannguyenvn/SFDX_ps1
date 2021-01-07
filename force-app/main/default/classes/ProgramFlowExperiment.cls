public with sharing class ProgramFlowExperiment {

    public static Integer EmailCounter = 0;

    private void SendEmail() {
        EmailCounter++;
        System.debug('Queuing email to send');
    }

    private void SendQueuedEmail() {
        System.debug('Sending Email Queue');
    }

    public void HandleContactUpdateTrigger1 (List<Contact> newList, Map<Id,Contact> oldMap) {
        for (Contact ct : newList) {
            if (ct.OwnerId != oldMap.get(ct.Id).OwnerId) {
                SendEmail();
            }
        }
        SendQueuedEmail();
    }

}
