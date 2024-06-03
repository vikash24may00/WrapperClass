/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-03-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityWrapper> getOpportunities() {
        // Only select opportunities with a non-null account name
        List<Opportunity> opps = [SELECT Id, Name, AccountId, Account.Name 
                                   FROM Opportunity 
                                   WHERE Account.Name != null 
                                   LIMIT 10];
        List<OpportunityWrapper> oppWrappers = new List<OpportunityWrapper>();

        for (Opportunity opp : opps) {
            oppWrappers.add(new OpportunityWrapper(opp));
        }

        return oppWrappers;
    }
}
