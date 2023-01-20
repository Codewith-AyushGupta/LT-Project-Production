public class CurrentAccountSelector {
	/**
     * This method return the CurrentAccount fields name
     */ 
    public static List<String> getCurrentAccountFields(){
        return new List<String>{
                                	'Name',
                                	'Current_Account_City__c',
                                	'Current_Account_Purchase_Volume__c',
                                	'Current_Account_Remark__c',
                                	'Current_Account_State__c',
                                    'Current_Account_Type__c',
                                     'Current_Length_of_Relationship__c'
                               };
    }
    
    /**
     * This method return the Current Account record if ids matched
     */ 
     public static List<Current_Account__c> getCurrentAccounts(Set<Id> preferredVendorIDs){
        String query = 'SELECT Id, ' + String.join( getCurrentAccountFields(), ', ' ) + ' FROM Current_Account__c WHERE Preferred_vendor__c IN :preferredVendorIDs';
        return database.query(query);
    }
    
}