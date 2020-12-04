trigger welcomeEmail on Contact (before insert) {
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); //SingleEmailMessage is System OBJ available in SF which stores the emails//
    
    for(contact c: Trigger.New){
        if(c.Email != null && c.FirstName != null){ //Executes only email and FN are not Null//
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();//creating instance for SingleEmailMessage//
            List<string> sendTo = new List<string>();//Creating a string list of sendTo - Eamil addresses//
            sendTo.add(c.Email); //Adding Emails to string 'sendTO'//
            mail.settoAddresses(sendTo);
            mail.setReplyTo(c.Owner.Email);
            mail.setSenderDisplayName(c.Owner.LastName);
            mail.setSubject('Welcome');
            string body = 'Dear ' + c.FirstName+ ',';
            body +='Thank you for shopping with us';
            mail.setHtmlBody(body);
            mails.add(mail);
            
        }
        
    }
    
    Messaging.sendEmail(mails);

}