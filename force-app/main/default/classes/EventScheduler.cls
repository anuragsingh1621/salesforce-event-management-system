global class EventScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {
        
        // Call your batch class
        EventReminderBatch batch = new EventReminderBatch();
        Database.executeBatch(batch);
    }
}