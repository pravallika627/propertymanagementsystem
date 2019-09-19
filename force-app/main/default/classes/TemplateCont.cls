public with sharing class TemplateCont {
   public property__c aTemplate{get; set;}
    public List<property__c> matchingTemplates{get; private set;}
	  public TemplateCont(){
      aTemplate = new property__c();
      matchingTemplates = new List<property__c>();
   }
	
   public void SearchTemplates(){
      matchingTemplates =[select Id,Owner_Type__c,Property_Location__c ,RecordType.Name,Balconies__c,Bedrooms__c,Flor_No__c,Furniture_Status__c,
                          No_of_open_sites__c,possesion_status__c,PropertyType__c from property__c where Property_Location__c=:aTemplate.Property_Location__c];

}
}