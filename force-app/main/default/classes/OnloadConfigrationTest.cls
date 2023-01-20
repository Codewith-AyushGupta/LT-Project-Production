@isTest
public class OnloadConfigrationTest {
    @isTest
    static void getPickListValuesTest(){
        Test.startTest();
        Map<String, List<String>> configrationsPickVal = new SampleRequestFormFetchOnloadConfigration().getPickListValues();
        Test.stopTest();
    }
    @isTest static void getStatesTest(){
        Test.startTest();
        List<CreditFormUtility.PicklistValueWrapper> getState = SampleRequestFormFetchOnloadConfigration.getStates();
        Test.stopTest();
    }
    @isTest static void getExistingRecordByIdTest(){
        Sample_Request_Form__c sampleRequest = new Sample_Request_Form__c();
        sampleRequest.Company_name__c = 'test1';
        sampleRequest.Email_address_for_confirmation__c='Test123@g.com';
        sampleRequest.Sample_Request_Form_Status__c = 'Submitted';
        insert sampleRequest;
        Test.startTest();
        List<Sample_Request_Form__c> getSampleFormList = new SampleRequestFormFetchOnloadConfigration().getExistingRecordById(sampleRequest.Id);
        Test.stopTest();
    }
}