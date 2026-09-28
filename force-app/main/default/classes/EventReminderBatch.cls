global class EventReminderBatch implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Start_Date__c FROM Event__c WHERE Start_Date__c = TODAY+1'
        );
    }

    global void execute(Database.BatchableContext bc, List<Event__c> scope) {
        for(Event__c ev : scope){
            System.debug('Reminder for Event: ' + ev.Name);
        }
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('Batch Completed');
    }
}