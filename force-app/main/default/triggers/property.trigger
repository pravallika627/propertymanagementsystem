trigger property on property__c (after insert) {
   
    if(trigger.isinsert&& trigger.isafter){
          list<user__c> p = new list<user__c>();
      for(property__c l:trigger.new)
      {
        user__c t = new user__c();
       t.First_Name__c=l.FirstName__c;
        t.LastName__c=l.LastName__c;
        t.Phone_Number__c=l.Phone_Number__c;
        t.Email_Address__c=l.Email__c;
        t.Name=l.username__c;
        t.Password__c=l.Password__c;
        t.Property_Type_Lookup__c=l.Id;
       p.add(t);
        }
        insert p;
    }
}