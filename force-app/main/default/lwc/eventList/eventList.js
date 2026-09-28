import { LightningElement, wire } from 'lwc';
import getEvents from '@salesforce/apex/EventController.getEvents';
import registerEvent from '@salesforce/apex/EventController.registerEvent';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EventList extends LightningElement {

    events;

    @wire(getEvents)
    wiredEvents({ data, error }) {
        if (data) {
            this.events = data;
        } else if (error) {
            console.error('Error fetching events:', error);
        }
    }

    handleRegister(event) {
        const eventId = event.target.dataset.id;

        registerEvent({ eventId: eventId })
            .then(result => {
                this.showToast('Success', result, 'success');
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}