global class LeadProcessor implements Database.Batchable<sObject>
{

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,LeadSource FROM Lead ';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Lead> scope)
    {
        for ( Lead a : scope)
        {
           a.LeadSource='Dreamforce';
        }
        update scope;
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}