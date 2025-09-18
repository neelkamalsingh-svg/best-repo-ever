@isTest
public class LeadProcessorTest {
    public static testMethod void createLead(){
        Test.startTest();
        //Lead ld_Var = new Lead();
        List<Lead> ld_List = new List<Lead>();
        
        for(Integer i=0;i<200;i++){
        Lead ld_Var = new Lead();
        ld_Var.LastName='Test-'+i ;
        ld_Var.Company='Test Company-'+i;
        ld_Var.CurrencyIsoCode='USD';
        ld_Var.LeadSource='Dreamforce';
        ld_Var.Status='Open - Not Contacted';
        ld_List.add(ld_Var);
        
        }
        
        Insert ld_List;
        
        LeadProcessor myLeadProcessor = new LeadProcessor(); 
        Id batchId = Database.executeBatch(myLeadProcessor);
        system.debug('batchId:::::::' +batchId);

        Test.stopTest();
    }
}