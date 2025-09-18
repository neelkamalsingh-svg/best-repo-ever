// Trigger for listening to Order events.
trigger OrderEventTrigger  on Order_Event__e (after insert) {    
    // List to hold all tasks to be created.
    List<Task> TaskList = new List<Task>();
    
    // Get user Id for task owner
    User myUser = [SELECT Id FROM User WHERE Name='NeelKamal Singh' LIMIT 1];
       
    // Iterate through each notification.
    for (Order_Event__e orderEvent : Trigger.New) {
        if (orderEvent.Has_Shipped__c == true) {
	            	Task newTask = new Task();
		            newTask.Priority = 'Normal' ;
                    newTask.Subject =  'Follow up on shipped order ' + orderEvent.Order_Number__c ;
					newTask.OwnerId = myUser.Id;
            		newTask.Status = 'Not Started';
            		//newTask.WhoId = myUser.Id;
		  TaskList.add(newTask);

        }
   }
    // Insert all Tasks corresponding to events received.
    insert TaskList;
}