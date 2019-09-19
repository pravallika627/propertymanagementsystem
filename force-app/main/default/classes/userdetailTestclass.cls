@isTest
public class userdetailTestclass {    
    static testmethod void save_test(){
        test.startTest();
        property__c tprob = new property__c(); 
        tprob.FirstName__c='mounika';
        tprob.LastName__c='S';
        tprob.Email__c='mounikaseelam07@gmail.com';
        tprob.Phone_Number__c='7095105871';
        tprob.Owner_Type__c='Owner';
        tprob.Property_Location__c='Hyderabad';
        tprob.PropertyType__c='New property';
        tprob.Bedrooms__c='2';
        tprob.Price__c=9875;
        tprob.possesion_status__c='Ready to move';
        tprob.Furniture_Status__c='Furniture';
        Seller_class ud=new Seller_class();
        ud.pobj=tprob;
        ud.selectedRT1=Schema.SObjectType.property__c.getRecordTypeInfosByName().get('Apartment/flat').getRecordTypeId();
        ud.save();
        test.stopTest();  
        
    }
    static testmethod void save_test1(){
        test.startTest();
        property__c tprob = new property__c(); 
        tprob.FirstName__c='mounika';
        tprob.LastName__c='S';
        tprob.Email__c='mounikaseelam07@gmail.com';
        tprob.Phone_Number__c='7095105871';
        tprob.Owner_Type__c='Owner';
        tprob.Property_Location__c='Hyderabad';
        tprob.PropertyType__c='New property';
        tprob.Bedrooms__c='2';
        tprob.Price__c=9875;
        tprob.possesion_status__c='Ready to move';
        //tprob.Furniture_Status__c='Furniture';
        Seller_class ud=new Seller_class();
        ud.pobj=tprob;
        ud.selectedRT1=Schema.SObjectType.property__c.getRecordTypeInfosByName().get('Apartment/flat').getRecordTypeId();
        ud.save();
        test.stopTest();  
        
    }
    static testmethod void sell_test(){       
        Test.startTest();
        PageReference pageRef = Page.selldetails;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.sell();
        Test.stopTest();
    }
    public static testmethod void buy_test(){       
        Test.startTest();
        PageReference pageRef = Page.propertydisplay;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.Buy();
        Test.stopTest();
    }
    public static testmethod void back_test(){       
        Test.startTest();
        PageReference pageRef = Page.homepage;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.Back();
        Test.stopTest();
    }
    public static testmethod void backfgh(){       
        Test.startTest();
        PageReference pageRef = Page.homepage;
        Test.setCurrentPage(pageRef);
        Seller_class ud=new Seller_class();
        ud.Back();
        Test.stopTest();
    }
    
    public static testmethod void bak_test(){       
        Test.startTest();
        PageReference pageRef = Page.propertydisplay;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.bak();
        Test.stopTest();
    }
    public static testmethod void bk_test(){       
        Test.startTest();
        PageReference pageRef = Page.propertydisplay;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.bk();
        Test.stopTest();
    }
    public static testmethod void propertydetailpage(){       
        Test.startTest();
        PageReference pageRef = Page.propertydetail;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.propertydetailpage();
        Test.stopTest();
    }
    public static testmethod void con(){       
        Test.startTest();
        PageReference pageRef = Page.buycontact;
        Test.setCurrentPage(pageRef);
        userdetails ud=new userdetails();
        ud.con();
        Test.stopTest();
    }
    public static testmethod void yes(){       
        test.startTest();
        userdetails ud=new userdetails();
        ud.yes();
        Test.stopTest();
    }
    public static testmethod void no(){       
        test.startTest();
        userdetails ud=new userdetails();
        ud.no();
        Test.stopTest();
    }
    public static testmethod void show(){       
        test.startTest();
        userdetails ud=new userdetails();
        ud.show();
        Test.stopTest();
    }
    public static testmethod void show1(){       
        test.startTest();
        Seller_class ud=new Seller_class();
        ud.selectedRT1=Schema.SObjectType.property__c.getRecordTypeInfosByName().get('Apartment/flat').getRecordTypeId();
        ud.show();
        ud.selectedRT1=Schema.SObjectType.property__c.getRecordTypeInfosByName().get('individual house/villa').getRecordTypeId();
        ud.show();
        Test.stopTest();
    }
    
    
    static testmethod void submit(){       
        Test.startTest();
        property__c d = new property__c(); 
        d.FirstName__c='mounika';
        d.LastName__c='S';
        d.Email__c='mounikaseelam07@gmail.com';
        d.Phone_Number__c='7095105871';
        d.Owner_Type__c='Owner';
        d.Property_Location__c='Hyderabad';
        d.PropertyType__c='New property';
        d.Bedrooms__c='2';
        d.Price__c=9875;
        d.possesion_status__c='Ready to move';
        d.Furniture_Status__c='Furniture';
        insert d;
        user__c h = new user__c();
        h.First_Name__c='pra';
        h.LastName__c='k';
        h.Phone_Number__c='9705436027';
        h.Email_Address__c='mounikaseelam07@gmail.com';
        h.Name='pravallika';
        h.Password__c='asdf';
        h.Property_Type_Lookup__c=d.Id;
        insert h;
        userdetails s=new userdetails();
        s.pId=d.Id;
        s.userobj=h;
        s.buyer=[select id,Property_Type_Lookup__r.Email__c from user__c where id=:s.userobj.Id];
        list<messaging.SingleEmailMessage> email= new list<messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage singlemail= new messaging.SingleEmailMessage();
        list<string> g= new list<string>();
        g.add(s.buyer.Property_Type_Lookup__r.Email__c);
        singlemail.setToAddresses(g);
        singlemail.subject='property management'; 
        string body='your property is good'; 
        singlemail.setHtmlBody(body);
        email.add(singlemail);
        messaging.sendEmail(email);
        s.submit();
        Test.stopTest();
    }
    static testmethod void search(){       
        Test.startTest();
        property__c d = new property__c(); 
        d.FirstName__c='mounika';
        d.LastName__c='S';
        d.Email__c='mounikaseelam07@gmail.com';
        d.Phone_Number__c='7095105871';
        d.Owner_Type__c='Owner';
        d.Property_Location__c='Hyderabad';
        d.PropertyType__c='New property';
        d.Bedrooms__c='2';
        d.Price__c=9875;
        d.possesion_status__c='Ready to move';
        d.Furniture_Status__c='Furniture';
        d.RecordTypeId=Schema.SObjectType.property__c.getRecordTypeInfosByName().get('Apartment/flat').getRecordTypeId();
        insert d;
        user__c h = new user__c();
        h.First_Name__c='pra';
        h.LastName__c='k';
        h.Phone_Number__c='9705436027';
        h.Email_Address__c='pravallika508@gmail.com';
        h.Name='pravallika';
        h.Password__c='asdf';
        h.Property_Type_Lookup__c=d.Id;
        insert h;
        userdetails ud=new userdetails();
        ud.lastname=h.LastName__c;
        ud.userlist=[select id,Property_Type_Lookup__r.Email__c from user__c where LastName__c=:ud.lastname];
        list<string> g= new list<string>(); 
        list<messaging.SingleEmailMessage> email= new list<messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage singlemail= new messaging.SingleEmailMessage();
        g.add(ud.userlist.Property_Type_Lookup__r.Email__c);
        singlemail.setToAddresses(g);
        singlemail.subject='property management'; 
        string body='your property is good'; 
        singlemail.setHtmlBody(body);
        email.add(singlemail);
        messaging.sendEmail(email); 
        ud.search();
        Test.stopTest();
    }
    static testmethod void search1(){       
        Test.startTest();
        user__c h = new user__c();
        h.First_Name__c='pra';
        h.LastName__c='k';
        h.Phone_Number__c='9705436027';
        h.Email_Address__c='pravallika508@gmail.com';
        h.Name='pravallika';
        h.Password__c='asdf';
        insert h;
        userdetails ud=new userdetails();
        ud.lastname='f';
        ud.search();
        Test.stopTest();
    }
}