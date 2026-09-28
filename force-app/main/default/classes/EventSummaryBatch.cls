global class EventSummaryBatch implements Database.Batchable<SObject> {

    // Step 1: Get all events
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, Name FROM Event__c
        ]);
    }

    // Step 2: Process each batch
    global void execute(Database.BatchableContext bc, List<Event__c> scope) {

        for(Event__c evt : scope){

            // Count attendees
            Integer totalAttendees = [
                SELECT COUNT()
                FROM Registration__c
                WHERE Event__c = :evt.Id
            ];

            // Calculate revenue
            Decimal totalRevenue = 0;

            List<Payment__c> payments = [
                SELECT Amount__c
                FROM Payment__c
                WHERE Registration__r.Event__c = :evt.Id
                AND Status__c = 'Paid'
            ];

            for(Payment__c p : payments){
                totalRevenue += p.Amount__c;
            }

            // Print in logs (for demo)
            System.debug('### Event: ' + evt.Name);
            System.debug('### Attendees: ' + totalAttendees);
            System.debug('### Revenue: ' + totalRevenue);
        }
    }

    // Step 3: Finish
    global void finish(Database.BatchableContext bc) {
        System.debug('Batch Job Completed');
    }
}