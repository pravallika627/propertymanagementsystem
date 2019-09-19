public class k {
   
    Public string selectedname{get;set;}
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(property__c acc :[SELECT id,RecordType.Name FROM property__c]){
            lstnamesel.add(new selectoption(acc.id,acc.RecordType.Name));
            }
            return lstnamesel; 
        }


}