trigger KeyReportTrigger on Key_Report__c (After insert,After delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert && ProductCleanUp.isInsertKeyReports==false){
         KeyReportTriggerHelper.isAfterInsert(Trigger.new);
    }
        if(Trigger.isDelete){
            KeyReportTriggerHelper.isAfterDelete(Trigger.old);
        }
        
    }
    

}