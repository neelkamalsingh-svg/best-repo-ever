public class AddPrimaryContact implements Queueable {
    
    private Contact contactVar;
    private String State;
    
    public AddPrimaryContact(Contact contVar, String StateVar) {
        this.contactVar = contVar;
        this.State = StateVar;
    }
    public void execute(QueueableContext context) {
       List<Contact> conListUpdate = new List<Contact>();
       Contact conVar1;
       
       List<Account> acctList = [Select id, name , BillingState from Account where BillingState=:State LIMIT 200];
        for (Account account : acctList) {
           conVar1 = new Contact();
           conVar1 = contactVar.clone(false,false,false,false);
           conVar1.AccountId=account.id;
           conListUpdate.add(conVar1);
        }
       
       if(conListUpdate.size()>0){
           INSERT conListUpdate;
       }
    }
    
}