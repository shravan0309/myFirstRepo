trigger CreateContact on Account (before insert, after insert, before update, after update, before delete, after delete) {
    
    CreateContactTrigger__c cfg = CreateContactTrigger__c.getInstance();
    
    if(cfg.Active__c == True) {
    
        if(trigger.isAfter && trigger.isInsert) { //To define the filter to when the logic execute - here only after insert//
            List<contact> toBeCreated = new List<contact>(); //creating an instance of list of contact object records that are created//
            List<opportunity> oppstoBeCreated = new List<opportunity>();
            for (Account acc: Trigger.New) { //for loop - for each NEW account created//
                Contact c = new contact(); //creating an instance for contact object//
                c.lastName = acc.Name;
                c.AccountId = acc.Id; //Linking the contact to Account//
                c.MailingCity = acc.BillingCity;
                c.MailingCountry = acc.BillingCountry;
                c.Title = 'From Trigger';
                //Adding contact the empty list defined initially//
                toBeCreated.add(c);
                
                if(acc.AnnualRevenue > cfg.Annual_Revenue__C) {
                    Opportunity o = new Opportunity();
                    o.Name = acc.Name;
                    o.AccountId = acc.ID;
                    o.Amount = acc.AnnualRevenue;
                    o.StageName = 'Prospecting';
                    o.CloseDate = Date.today();
                    o.Type = 'Existing Customer - Upgrade';
                    oppstoBeCreated.add(o);
                }
            }
            
            insert toBeCreated;
            insert oppstoBeCreated;
    	}
    }
}