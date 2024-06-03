public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityWrapper> getOpportunities() {
        List<Opportunity> opps = [SELECT Id, Name, AccountId, Account.Name FROM Opportunity LIMIT 50];
        List<OpportunityWrapper> oppWrappers = new List<OpportunityWrapper>();

        for (Opportunity opp : opps) {
            oppWrappers.add(new OpportunityWrapper(opp));
        }

        return oppWrappers;
    }
}