trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToCreate = new List<Task>();

    for (Opportunity opp : Trigger.new) {
        // Check if the Opportunity stage is Closed Won
        if (opp.StageName == 'Closed Won') {
            // Create a new Task for the Opportunity
            Task followUpTask = new Task();
            followUpTask.Subject = 'Follow Up Test Task';
            followUpTask.WhatId = opp.Id;  // Associate the task with the Opportunity
            followUpTask.OwnerId = opp.OwnerId; // Optionally set the task owner as the opportunity owner

            tasksToCreate.add(followUpTask);
        }
    }

    // Insert all tasks at once to ensure bulkification
    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}