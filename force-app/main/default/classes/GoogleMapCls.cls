public class GoogleMapCls {
    Public static Account acc{get;set;}
    public static void test(){
       acc =  [Select Id,Name,BillingPostalCode,BillingStreet,BillingCity,BillingState,BillingCountry FROM Account Limit 1]; 
    system.debug('((((((((((((('+acc);
    }
}