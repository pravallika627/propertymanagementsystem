public class sendEmail {
	public String subject { get; set; }
	public String body { get; set; }
   // public String ToAddresses { get; set; }
    List<String> emails=new List<String>{'mounikaseelam07@gmail.com'};
	//private final Account account;

	// Create a constructor that populates the Account object
	public pageReference send() {
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        email.setSubject( subject );
		email.setToAddresses( emails );
		email.setPlainTextBody( body );
      
        Messaging.SendEmailResult [] r = 
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
		
		return null;
    }
}