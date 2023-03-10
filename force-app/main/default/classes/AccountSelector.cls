public class AccountSelector {
    
    public static Map<Id,Account> getAccountsByIds(Set<Id> ids){
        return new Map<Id,Account>([SELECT Id,Account_Category__c,Traditional_Dealer__c,
                                    Landscape_outside_kitchens__c, 
                                    Production__c,
                                    Notes__c,
                                    Primary_Branch__r.Name,
                                    Custom__c,
                                    Remodel__c,
                                    Industry_Focus__c FROM Account WHERE Id IN :ids]);
    }
     public static List<Account> getAccountById(Set<Id> ids){
        return [SELECT Id,OwnerId,Name FROM Account WHERE Id IN :ids];
    }
    public static List<Account> getAccountCreatedInMonthByUser(){
        return [SELECT Id, Name 
                        FROM Account 
                        WHERE ownerid =:userinfo.getuserid()  AND CreatedDate >= LAST_N_DAYS:30];
    }
    public static List<Account> getAccountCreatedInYearByUser(){
        return [SELECT Id, Name 
                        FROM Account 
                        WHERE ownerid =:userinfo.getuserid()  AND CreatedDate >= LAST_N_DAYS:365];
    }
}