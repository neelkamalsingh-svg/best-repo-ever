global class ConnectedAppPluginExample extends Auth.ConnectedAppPlugin
{
    // Authorize the app if the user has achieved quota tracked in a custom field
    global override Boolean authorize(Id userId, Id connectedAppId, Boolean isAdminApproved, Auth.InvocationContext context) 
    {
        // Create a custom boolean field HasAchievedQuota__c on the user record 
        // and then uncomment the block below 
        // User u = [select id, HasAchievedQuota__c from User where id =: userId].get(0);
        // return u.HasAchievedQuota__c;
        
        return isAdminApproved;
    }
        
    // Call a flow during refresh
    global override void refresh(Id userId, Id connectedAppId, Auth.InvocationContext context)
    {
       try
       {
          Map<String, Object> inputVariables = new Map<String, Object>();
          inputVariables.put('userId', userId);
          inputVariables.put('connectedAppId', connectedAppId);
            
         // Create a custom trigger ready flow and uncomment the block below
         // Flow.Interview.MyCustomFlow interview = new Flow.Interview.MyCustomFlow(inputVariables);
         // interview.start();
        } catch ( Exception e ) {
           System.debug('FLOW Exception:' + e);
        }  
    }
        
    // Return a user’s permission set assignments            
    global override Map<String,String> customAttributes(Id userId, Id connectedAppId, Map<String,String>
        formulaDefinedAttributes, Auth.InvocationContext context)         
    {  
        List<PermissionSetAssignment> psas = [SELECT id, PermissionSet.Name FROM PermissionSetAssignment 
        WHERE PermissionSet.IsOwnedByProfile = false AND (AssigneeId = :userId)];
        String permsets = '[';
        for (PermissionSetAssignment psa :psas)
        {
            permsets += psa.PermissionSet.Name + ';';
        }
        permsets += ']';
        formulaDefinedAttributes.put('PermissionSets', permsets);
        return formulaDefinedAttributes;     
    } 
}