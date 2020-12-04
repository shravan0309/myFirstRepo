trigger UpdateAccount on Account (before insert, before update) {
    
    for(Account acc: Trigger.New){
        
        if(acc.Type == 'prospect')
        {acc.Active__c = 'Yes';}
        else{acc.Active__c = 'No';}
    }

}