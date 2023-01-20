({
    
    getAllReportByLoginUser:function(component, event,helper){
        var action = component.get('c.getAllReportByLoginUser');
        
        action.setParams({ reportType : component.get("v.type") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                var setOfIds=[];
                var records = response.getReturnValue();
                if(records != null){
                    component.set('v.reportdata', records);
                    records.forEach(function(record) {
                        if(record.Key_Report__r.Id !=undefined){
                            setOfIds.push(record.Key_Report__r.Id); 
                        }
                        
                    });  
                    component.set('v.selectedIds',setOfIds); 
                }
                
            }            
            
        });
        
        $A.enqueueAction(action);
        
    },
    fetchAllMasterReports : function(component, event,helper) {
        
        var action = component.get('c.getAllMasterReports');
        action.setParams({ reportType : component.get("v.type") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                if(records != null){
                    records.forEach(function(record) {
                        record.linkName = '/' + record.Id;
                        record.checked=true;
                    });   
                    component.set('v.reportList', records);
                    var selectedIds=component.get('v.selectedIds');
                    component.set("v.selectedRows",selectedIds);
                }     
            }          
            
        });
        
        $A.enqueueAction(action);
        
    },
    getRecordType:function(component, event, helper){
        var action = component.get("c.getRecorTypes");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var value=response.getReturnValue();
                component.set("v.type",value.Key_Reports); 
                helper.getAllReportByLoginUser(component, event,helper);      
            }
        });
        $A.enqueueAction(action);
    },
    
})