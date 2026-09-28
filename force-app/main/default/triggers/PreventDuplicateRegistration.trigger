trigger PreventDuplicateRegistration on Registration__c (before insert) {

    Set<Id> eventIds = new Set<Id>();
    Set<Id> attendeeIds = new Set<Id>();

    for(Registration__c reg : Trigger.new){
        if(reg.Event__c != null && reg.Attendee__c != null){
            eventIds.add(reg.Event__c);
            attendeeIds.add(reg.Attendee__c);
        }
    }

    List<Registration__c> existing = [
        SELECT Event__c, Attendee__c
        FROM Registration__c
        WHERE Event__c IN :eventIds
        AND Attendee__c IN :attendeeIds
    ];

    for(Registration__c reg : Trigger.new){
        for(Registration__c ex : existing){
            if(reg.Event__c == ex.Event__c &&
               reg.Attendee__c == ex.Attendee__c){
                reg.addError('You are already registered for this event!');
            }
        }
    }
}