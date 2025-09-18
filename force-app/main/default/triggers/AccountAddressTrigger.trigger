trigger AccountAddressTrigger on Account ( before insert, before update) {

for (Account acc : Trigger.new) {
        // Check if the Match Billing Address checkbox is true
        if (acc.Match_Billing_Address__c) {
            // Set the Shipping Postal Code to match the Billing Postal Code
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }

}