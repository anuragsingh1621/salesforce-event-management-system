trigger RegistrationEmail on Registration__c (after insert) {

    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for(Registration__c reg : Trigger.new){
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setToAddresses(new String[]{UserInfo.getUserEmail()});
        mail.setSubject('Event Registration Confirmation');
        mail.setPlainTextBody('You have successfully registered for the event.');

        emails.add(mail);
    }

    if(!emails.isEmpty()){
        Messaging.sendEmail(emails);
    }
}