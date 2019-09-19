public class recordTypeSample{
    public boolean flag{get;set;}
     public boolean flag1{get;set;}
    public String selectedRT{get;set;}
    public List<SelectOption> recordTypeList {get;set;}
    public property__c customer {get;set;}
     
    public recordTypeSample(){
        flag=false;
        customer = new property__c();
        recordTypeList = new List<SelectOption>();
        getRecordTypeList();
     
    }
     
    public void getRecordTypeList(){
      List<RecordType> rtList = [SELECT Id,Name FROM RecordType WHERE SObjectType='property__c'];
        recordTypeList.add(new SelectOption('--None--', '--None--'));
        for(RecordType rt : rtList)
        {
            recordTypeList.add(new SelectOption(rt.Id, rt.Name));
        }
    }
     
    /*public void getPickListValues(){
          if(selectedRT != null){
            customer = new property__c(RecordTypeId = selectedRT);
        }
    }*/
    public void show(){
         system.debug(selectedRT);
        if(selectedRT!=null){
        flag=true;
            flag1=false;
        }
    }
}