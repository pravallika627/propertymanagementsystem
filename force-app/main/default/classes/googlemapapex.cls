public virtual class googlemapapex { 
    public String city {get;set;}
    public String temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}
    public Date Date1 {set;get;}
    
    public googlemapapex(ApexPages.StandardController stdController) {
        Account account = (Account)stdController.getRecord();
        account = [SELECT Id,City__c FROM Account WHERE Id =:account.Id];
         String accountCity = account.City__c;
        String apiKey = 'AIzaSyC_eRj_z0Q7Rbh4sig9iXi43qOREDq8OTA';
        
        //String requestEndpoint='callout:weatherNamed';
        String requestEndpoint='https://www.google.com/maps';
        requestEndpoint += '?q=' + accountCity;
        requestEndpoint += '&units=metric';
        requestEndpoint += '&APPID=' + apiKey;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        // request.setHeader('apiKey', value)
        HttpResponse response = http.send(request);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            
            // Deserialize the JSON string into collections of primitive data types.
            Map<string,Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());
            city = String.valueOf(results.get('name'));
            
            Map<string,Object> mainResults = (Map<string,Object>)(results.get('main'));
            temp = String.valueOf(mainResults.get('temp'));
            pressure = String.valueOf(mainResults.get('pressure'));
            humidity = String.valueOf(mainResults.get('humidity')); 
            temp_min = String.valueOf(mainResults.get('temp_min')); 
            temp_max = String.valueOf(mainResults.get('temp_max'));
            Date1=date.valueOf(mainResults.get('Date1'));
        } else {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error retrieving the weather information.');
            ApexPages.addMessage(myMsg);
        }
        system.debug(temp_min);
        if(temp_min>='20'){
            system.debug('********deva');
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();  
            
            Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
            string[] ss = new string[]{'divyamadhu562@gmail.com'};
            semail.setToAddresses(ss);
            semail.setSubject('Single Email message Example');
            semail.setPlainTextBody('Hello!!!!!!!!!!This is a test email to test single email message program');
            Messaging.sendEmail(new Messaging.singleEmailMessage[]{semail});
        }     
    }

}