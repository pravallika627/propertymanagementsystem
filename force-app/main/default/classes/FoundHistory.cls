public class FoundHistory {
    public list<user__c> buyer {set;get;}
    public String FirstName{set;get;}
    public String LastName{set;get;}
    public String PhoneNumber{set;get;}
    public String query;
     public void buyersearch()
    {
        query='Select First_Name__c,LastName__c,Phone_Number__c from user__c ';
        if(FirstName == '' &&LastName ==''&&PhoneNumber =='' )
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter details'));
        }
        else if((FirstName!=''&&FirstName!=NULL)&&(LastName!=''&& LastName!=NULL)&&(PhoneNumber!='' && PhoneNumber!=NULL))
        {
            query = query + ' where First_Name__c like \'%'+FirstName+'%\' and LastName__c=\''+LastName+'\' and Phone_Number__c=\''+PhoneNumber+'\'';
            
        }
        else
        {
            if((FirstName!='' && FirstName!=NULL)&&(PhoneNumber!='' && PhoneNumber!=NULL))
            {
                query = query + ' where First_Name__c  like \'%'+FirstName+'%\'and LastName__c=\''+LastName+'\'';  
            }
            else 
            {
                if((LastName!='' && LastName!=NULL)&&(PhoneNumber!='' && PhoneNumber!=NULL))
                {
                    query = query +' where LastName__c =\''+LastName+'\' and PhoneNumber=\''+PhoneNumber+'\'';
                }
                else
                {
                    query = query +' where Phone_Number__c =\''+PhoneNumber+'\'';
                }
            }
            
        }
        buyer=database.query(query);
    }
    public pagereference newbuyer() 
    {
        pagereference pg = new pagereference ('/apex/');
        return pg;
    }
}