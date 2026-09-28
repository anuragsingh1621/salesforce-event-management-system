public with sharing class EventController {

    @AuraEnabled(cacheable=true)
    public static List<Event__c> getEvents() {
        return [
            SELECT Id, Name, Location__c, Start_Date__c, End_Date__c
            FROM Event__c
            ORDER BY Start_Date__c ASC
        ];
    }

    @AuraEnabled
    public static String registerEvent(Id eventId) {

        User currentUser = [
            SELECT Id, Email
            FROM User
            WHERE Id = :UserInfo.getUserId()
            LIMIT 1
        ];

        Contact attendee = [
            SELECT Id
            FROM Contact
            WHERE Email = :currentUser.Email
            LIMIT 1
        ];

        Registration__c reg = new Registration__c();

        reg.Event__c = eventId;
        reg.Attendee__c = attendee.Id;
        reg.Registration_Date__c = Date.today();
        reg.Ticket_Type__c = 'Regular';

        insert reg;

        return 'Registered Successfully';
    }
}