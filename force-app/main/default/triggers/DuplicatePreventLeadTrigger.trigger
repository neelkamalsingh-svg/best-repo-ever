trigger DuplicatePreventLeadTrigger on Lead (before insert) {
    Map<String, lead> leadMap = new Map<String, lead>(); //Collection
    
    for(Lead leadVar :System.trigger.new){ //for loop
        if(leadVar.email!=null){ //logic , if else
            if(leadMap.containsKey(leadVar.email)){
              leadVar.email.addError('Lead with this email already exists : '+leadVar.email);
            }
          else{
            leadMap.put(leadVar.email,leadVar);
          }
        }
    }

    //LeadMap - is a varaible
    for(Lead leadVar2 : [SELECT email from lead WHERE email in :leadMap.keySet()]){ //SOQL
       
         
        leadMap.get(leadVar2.email).addError('Duplicate lead already exists -alert 2');//Validation error
    }

}