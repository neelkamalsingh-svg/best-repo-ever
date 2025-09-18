trigger CandidateTrigger on Candidate__c (before insert,before update) {
    //trigger.new
    for(Candidate__c candVar :trigger.new  ){
       //candVar.Valid__c=true;
        if (!candVar.Valid__c){
            candVar.Valid__c=true;
        }
    }
    
    system.debug('Neel tests...trigger ends');
}