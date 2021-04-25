trigger OrderEventTrigger on Order_Event__e  (after insert) {
    List<Task> tasks = new List<Task>();

    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c  == true) {
            // Create Task 
            Task t = new Task();
            t.Priority = 'Medium';
            t.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = event.CreatedBy;
            tasks.add(t);
        }
   }
}