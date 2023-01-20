trigger SelectionSheettrigger on Selection_Sheet__c (before insert,after insert,after update,after delete) {
    if(Trigger.isafter){
        if(Trigger.isinsert){
            SelectionSheetTriggerHelper.productInsertInOpportunityLineItem(Trigger.new);
            SelectionSheetTriggerHelper.selectionSheetsAfterInsert(Trigger.new);
            
        }
        if(Trigger.isupdate){
            SelectionSheetTriggerHelper.selectionSheetsAfterInsert(Trigger.new);
        }
        if(Trigger.isdelete){
          SelectionSheetTriggerHelper.selectionSheetsAfterInsert(Trigger.old);
        }
    }
    
    if(Trigger.isbefore){
        if(Trigger.isinsert){
            SelectionSheetTriggerHelper.isbeforeInsert(Trigger.new);
            //SelectionSheetTriggerHelper.checkduplicateProduct(Trigger.new);
        }
    }
}