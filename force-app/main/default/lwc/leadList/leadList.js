
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
            window.clearTimeout(this.delayTimeout);
            this.delayTimeout = setTimeout(() => {
                this.dispatchEvent(new CustomEvent('newsearch', {detail: { value: this.searchTerm }}));
            }, DELAY);           
        }  
    }    

    @wire(searchLeads, {
        searchTerm: '$searchTerm'
    })
    loadLeads({ error, data }) {
        if (data) {
            this.leads = data;
            this.dispatchEvent(new CustomEvent('searchcomplete', {detail: { value: this.searchTerm }}));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.leads = undefined;
        }
    }
}
