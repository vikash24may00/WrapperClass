public class OpportunityWrapper {
    @AuraEnabled
    public String opportunityId { get; set; }
    @AuraEnabled
    public String opportunityName { get; set; }
    @AuraEnabled
    public String accountId { get; set; }
    @AuraEnabled
    public String accountName { get; set; }
    @AuraEnabled
    public String contactName { get; set; }

    public OpportunityWrapper(Opportunity opp) {
        this.opportunityId = opp.Id;
        this.opportunityName = opp.Name;
        this.accountId = opp.AccountId;
        this.accountName = opp.Account.Name;

        // Get at least one contact related to the Opportunity
        List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE AccountId = :opp.AccountId LIMIT 1];
        if (!contacts.isEmpty()) {
            this.contactName = contacts[0].Name;
        } else {
            this.contactName = 'No Contact';
        }
    }
}