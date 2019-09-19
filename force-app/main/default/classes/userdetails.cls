public class userdetails 
{  
    public list<string> t;//stores list of seller emails
    public list<string> g{set;get;} //stores list of seller emails
    public String selectedRT{get;set;}
    public  list<property__c>propertyList{get;set;}
    public List<SelectOption>recordTypeList{get;set;}
    public property__c customer{get;set;}
    public list<property__c> proList{get;set;}
    public String subject ;
    public String body;
    public String email;
    public user__c buyer {get;set;}  
    public user__c userlist{get;set;} 
    public user__c userobj{get;set;} 
    public list<property__c> conlist{get;set;}
    public boolean fl{get;set;}
    public boolean fl1{get;set;}
    public String accId{get;set;}
    public String pId{get;set;}
    public boolean f{get;set;}
    public boolean h{get;set;}
    public id propId{get;set;}
    Public string lastname{get;set;}    
    public boolean m{get;set;}
    public userdetails ()
    {   
        g= new list<string>();
        t= new list<string>();
        proList= new list<property__c>();
        conlist= new list<property__c>();
        buyer= new user__c();
        userlist= new user__c();
        propertyList=new list<property__c>();
        customer = new property__c();
        recordTypeList = new List<SelectOption>();
        getRecordTypeList();
        fl=false;
        fl1=false;
        f=false; 
        h=false;
       }
     public pagereference sell(){
        fl=true;
     pageReference t= new pageReference('/apex/selldetails');
        return t; 
    }
    public pagereference Buy(){ 
     pageReference t= new pageReference('/apex/propertydisplay');
        t.setRedirect(true);
        return t;
    }
    public pageReference con(){
        userobj= new user__c();
        pageReference t= new pageReference('/apex/buycontact');
        conlist=[select id,Name,Owner_Type__c,Property_Location__c,Phone_Number__c,Email__c from property__c where id =:accId];
        return t;
    }
    public pagereference submit(){
        h=false;
        pagereference r =new pagereference('/apex/Homepage');
        userobj.Property_Type_Lookup__c=pId;
        try{
                  insert userobj; // user
        }
        catch(Exception e)
              {
        pagereference t = new pagereference('/apex/buycontact');
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.WARNING,'already existing user'));
        return t;
             }
     buyer=[select id,Email_Address__c,Property_Type_Lookup__r.Email__c,First_Name__c,LastName__c,Phone_Number__c,Property_Type_Lookup__c from user__c where id =:userobj.Id];
        list<messaging.SingleEmailMessage> email= new list<messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage singlemail= new messaging.SingleEmailMessage();
        t.add(buyer.Property_Type_Lookup__r.Email__c);
        singlemail.setToAddresses(t);
        singlemail.subject='property management'; 
        string body='your property is good'; 
        singlemail.setHtmlBody(body);
        email.add(singlemail);
        messaging.sendEmail(email);  
        return r;     
    }  
    public pagereference no(){
        userobj= new user__c();
        f=true;
        h=false;
        m=false;
        return null;
    } 
    public pagereference yes(){
        lastname=null;
        f=false;
        h=true;
        return null;
    } 
      public pagereference Back(){
      pageReference t= new pageReference('/apex/homepage');
      return t;
    } 
    
     public pagereference bk(){
     pageReference t= new pageReference('/apex/propertydisplay');                     
     return t;
    } 
    public pagereference bak(){
        h=false;
        f=false;
        m=false;
     pageReference t= new pageReference('/apex/propertydisplay');        
        return t;
    }
   
public pagereference propertydetailpage(){
     pageReference t= new pageReference('/apex/propertydetail');
     proList=[select Id,Name,Owner_Type__c,Property_Location__c ,RecordType.Name,property_photo__c,Balconies__c,Bedrooms__c,Flor_No__c,Furniture_Status__c,No_of_open_sites__c,possesion_status__c,PropertyType__c,Road_facility__c,width_of_road_facing_the_plot__c from property__c where id=:propId]; 
     return t;
    }  
    public void getRecordTypeList(){
        List<RecordType> rtList = [SELECT Id,Name FROM RecordType WHERE SObjectType='property__c'];
        recordTypeList.add(new SelectOption('--None--', '--None--'));
        for(RecordType rt : rtList)
        {
            recordTypeList.add(new SelectOption(rt.Id, rt.Name));
        }
    }
    
     
    public pageReference show(){
         fl1=true;
  propertyList = [SELECT Id,property_photo__c,FirstName__c,Name,Owner_Type__c,Property_Location__c,Phone_Number__c,Email__c,RecordType.Name FROM property__c 
                                          WHERE RecordtypeId =:selectedRT limit 10];
        return null;
        }
   
          
         public pagereference  search(){
             m=true; 
             try{
   userlist = [select id,Email_Address__c,Property_Type_Lookup__r.Email__c,First_Name__c,LastName__c,Phone_Number__c,Property_Type_Lookup__c from user__c where LastName__c =:lastname];
                  }
             catch(exception e)
             {
                 h=false;
                 m=false;
       pagereference t = new pagereference('/apex/buycontact');
           ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.WARNING,'your not an existing user'));
                 return t;
             }
           list<messaging.SingleEmailMessage> email= new list<messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage singlemail= new messaging.SingleEmailMessage();
        g.add(userlist.Property_Type_Lookup__r.Email__c);
        singlemail.setToAddresses(g);
        singlemail.subject='property management'; 
        string body='your property is good'; 
        singlemail.setHtmlBody(body);
        email.add(singlemail);
        messaging.sendEmail(email); 
             return null;
             }
}