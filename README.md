# Salesforce Event Management System

A Salesforce-based Event Management System developed using Apex, Lightning Web Components (LWC), SOQL, and Salesforce automation to manage events and attendee registrations.

## Features

- Event listing and management
- Event registration for users
- Attendee management
- Duplicate registration prevention
- Registration date tracking
- Ticket type management
- Registration status management
- Automated email functionality
- Scheduled event processing
- Batch processing for event reminders
- Validation rules for data integrity
- Salesforce reports and dashboards

## Salesforce Objects

- Event__c
- Registration__c
- Attendee__c
- Vendor__c
- Payment__c
- Event_Vendor__c

## Apex Components

- EventController
- PreventDuplicateRegistration
- RegistrationEmail
- EventScheduler
- EventReminderBatch

## Technologies Used

- Salesforce
- Apex
- Lightning Web Components (LWC)
- SOQL
- Salesforce Objects
- Validation Rules
- Scheduled Apex
- Batch Apex
- Salesforce Reports & Dashboards

## Project Workflow

1. User views available events.
2. User selects an event and clicks Register.
3. System identifies the logged-in user's Contact/Attendee record.
4. Registration is created against the selected event.
5. Duplicate registration is prevented through validation/Apex logic.
6. Registration details are stored in Salesforce.
7. Automated email/reminder processes handle subsequent communication.

## Project Screenshots

Screenshots demonstrating the Event Management System will be added here.

## Author

Anurag Singh

MCA | Salesforce & Software Development
