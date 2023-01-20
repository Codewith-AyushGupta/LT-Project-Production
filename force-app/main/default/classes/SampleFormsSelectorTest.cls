@isTest
public class SampleFormsSelectorTest {
    public static testMethod void getSAmpleRequestFormWithSampleItemsByIdsTest() {
        
        Set<Id> sampIds = new Map<Id, Sample_Request_Form__c>([select id from Sample_Request_Form__c]).keySet();
        SampleFormsSelector obj =new SampleFormsSelector();
        Map<Id,Sample_Request_Form__c> ids = obj.getSAmpleRequestFormWithSampleItemsByIds(sampIds); 
        Map<Id,Sample_Request_Form__c> ids2 = obj.getRecordWithApprovalComments(sampIds);
    }
    
    
     public static testMethod void getRecordWithApprovalCommentsTest() {
        
        Set<Id> sampIds = new Map<Id, Sample_Request_Form__c>([select id from Sample_Request_Form__c]).keySet();
        SampleFormsSelector obj =new SampleFormsSelector();
        Map<Id,Sample_Request_Form__c> ids = obj.getSAmpleRequestFormWithSampleItemsByIds(sampIds);
        Map<Id,Sample_Request_Form__c> ids2 = obj.getRecordWithApprovalComments(sampIds);
    }
}