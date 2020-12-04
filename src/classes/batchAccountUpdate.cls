//Req. Update the name of All Accounts//
global class batchAccountUpdate implements Database.Batchable<sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){ //QueryLocator is an object defined internally by SF which stores the values from the query and return it on return command//
        string query = 'SELECT ID, Name FROM Account';
        return Database.getQueryLocator(query);
    }
	
    global void execute(Database.BatchableContext BC, List<Account>scope){ //The scope contains list of first batch of 200 records queries in start method//
        //Here the scope size is 200 records. Max batch size by default. We can change that to any number say 20 for ex.//
        for(Account a: scope){
            a.Name = a.Name+'batchUpdate';
        }
        update scope;
    }
    
    global void finish(Database.batchableContext BC){
        
    }
}

//Now we have written a class
//Then go to anonymous and create an instance of the class (batchAccountUpdate)
//then execute
/*batchAccountUpdate b = new batchAccountUpdate();
Database.executeBatch(b);*/