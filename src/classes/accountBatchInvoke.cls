//Schedulable class - Schedule a time to run the batch automatically//
//Write a class with schedulable interface and then go to apex classess - hit schedule apex and schedule the invoking automatically//
global class accountBatchInvoke implements Schedulable {
    global void execute(SchedulableContext SC) {
        batchAccountUpdate b = new batchAccountUpdate();
		Database.executeBatch(b);
    }

}