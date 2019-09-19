public class Seller_class { 
    public boolean flag{get;set;}
    public boolean flag1{get;set;}
    public String selectedRT1{get;set;}
    public List<SelectOption>recordTypeList{get;set;}
    public property__c pobj{get;set;}
    public Seller_class()
    {
        flag=false;
        flag1=false;
        pobj=new property__c();
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
  
    public void Show(){
        
        if(selectedRT1==Schema.SObjectType.property__c.getRecordTypeInfosByName().get('Apartment/flat').getRecordTypeId())
        {
           
            flag=true;
            flag1=false;
        }
        else
        { 
            if(selectedRT1==Schema.SObjectType.property__c.getRecordTypeInfosByName().get('individual house/villa').getRecordTypeId()){
             
                flag1=true;
                flag=false;
            }
        
            
        }
        
    }
    public pageReference save()
    {     
        
        try{
            pobj.RecordTypeId=selectedRT1;
            insert pobj; // user
            if(pobj.Id!=null)
            {
              ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Successfully Saved'));
                
                pageReference t= new pageReference('/apex/homepage');
        t.setRedirect(true);
           return t;
            }
        }
        catch(DmlException e)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.error,e.getDmlMessage(0)));
          
          }
        return null;
        
    }
   
    
    public pagereference Back(){
        pageReference t= new pageReference('/apex/homepage');
        return t;
    }
    
}