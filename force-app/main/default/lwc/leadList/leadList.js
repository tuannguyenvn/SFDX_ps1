
import { LightningElement, track, wire} from 'lwc';
import searchLeads from '@salesforce/apex/LeadSearchController.searchLeads';

const DELAY = 350;

const _COLS = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text'
    },
    {
        label: 'Title',
        fieldName: 'Title',
        type: 'text'
    },
    {
        label: 'Company',
        fieldName: 'Company',
        type: 'text'
    },
    {
        label: 'View',
        type: 'button-icon',
        initialWidth: 75,
        typeAttributes: {
            title: 'View Details',
            alternativeText: 'View Details',
            iconName: 'action:info'

        }
    }
];

export default class LeadList extends (LightningElement) {
    @track leads =[];
    @track searchTerm;
    @track cols = _COLS;
    @track error;

    
    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
 
        if (this.leads) {
            var selectedEvent = new CustomEvent('newsearch', {detail: this.searchTerm});
            window.clearTimeout(this.delayTimeout);
            this.delayTimeout = setTimeout(() => {
                this.dispatchEvent(selectedEvent);
            }, DELAY);           
        }  
    }    

    @wire(searchLeads, {
        searchTerm: '$searchTerm'
    })
    loadLeads({ error, data }) {
        if (data) {
            this.leads = data;
            var selectedEvent = new CustomEvent('searchcomplete', {detail: this.searchTerm});
            this.dispatchEvent(new CustomEvent(selectedEvent));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.leads = undefined;
        }
    }
}
