
import { LightningElement, track} from 'lwc';

export default class LeadList extends (LightningElement) {
    @track leads =[];
    @track searchTerm;

    
    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
        const selectedEvent = new CustomEvent('newsearch', {detail: this.searchTerm});
        this.dispatchEvent(selectedEvent);
    }

   
    leads = [
        {
            "Id": "LeadRef1",
            "Name": "Bertha Boxer",
            "Title": "Director of Vendor Relations",
            "Company": "Farmers Coop. of Florida",
            "Street": "321 Westcott Building",
            "City": "Tallahassee",
            "State": "FL",
            "PostalCode": "32306"
        },
        {
            "Id": "LeadRef2",
            "Name": "Phyllis Cotton",
            "Title": "CFO",
            "Company": "Chamber of Commerce",
            "Street": "300 E Park Ave",
            "City": "Tallahassee",
            "State": "FL",
            "PostalCode": "32301"
        },
        {
            "Id": "LeadRef3",
            "Name": "Jeff Glimpse",
            "Title": "SVP, Procurement",
            "Company": "Tallahassee Taxes",
            "Street": "1327 Colorado St",
            "City": "Tallahassee",
            "State": "FL",
            "PostalCode": "32304"
        }
    ];
    
    
}
